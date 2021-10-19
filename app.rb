require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './database_connection_setup'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'auth/register'
    # We could make this page the sign up page [post -> /register]
    # There is a link to logging in -> /login
    # Link to view all listings -> /all
  end

  post '/register' do
    # Collects params[:name], params[:email], params[:password]
    redirect '/login'
  end

  get '/login' do
    erb :'auth/login'
  end

  post '/login' do
    # Collects params[:email], params[:password]
    redirect '/spaces'
  end

  get '/spaces' do
    erb :'spaces/all'
  end

  get '/spaces/create' do
    # A page to put a space up
    erb :'spaces/create'
  end

  post '/spaces/create' do
    # Collects params[:name], params[:description], params[:price], params[:avail_from], params[avail_to]
    redirect '/spaces'
  end

  get '/spaces/:space_id/view' do
    # Display a specific space
    # Maybe has a calender with available dates?
    # Maybe has a list of hyperlinks for available dates
    # Dates go to booking confirmation page (or skip)
    # erb :'spaces/individual'
  end

  get 'spaces/:space_id/confirm' do
    # Booking confirmation page - neccessary?
    # erb :'booking/summary'
  end

  post '/spaces/:space_id/confirm' do
    # Collects params[:space_id](inherently collects this in the path), params[:user_id], params[:date]
  end

  get '/requests' do
    # Displays list of requests made ->
    # Displays list of requests receieved
    # erb :'requests/display'
  end
end
