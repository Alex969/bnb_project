require 'sinatra/base'
require 'sinatra/reloader'

require './lib/user'
require './lib/booking'
require './lib/listing'
require './lib/database_connection'

require 'pg'
require_relative './database_connection_setup'


class BnB < Sinatra::Base
  enable :sessions, :method_override
  
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
    # Collects params[:username], params[:email], params[:password]
    User.sign_up(username: params[:username], email: params[:email], password: params[:password])
    redirect '/login'
  end

  get '/login' do
    erb :'auth/login'
  end

  post '/login' do
    # Collects params[:email], params[:password]
    email = params[:email]
    password = params[:password]

    if User.authenticate(email: email, password: password)
      session[:user] = User.login(email: email, password: password)
      redirect '/spaces'
    else
      redirect '/login'
    end
  end

  get '/spaces' do
    @username = session[:user].username
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
