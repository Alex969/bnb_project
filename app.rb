require 'sinatra/base'
require 'sinatra/reloader'

require './lib/user'
require './lib/booking'
require './lib/listing'

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
    User.login(email: params[:email], password: params[:password])
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces
  end

  get '/spaces/create' do
    # A page to put a space up
  end

  post '/spaces/create' do
    # Collects params[:name], params[:]
  end

  get '/spaces/:id' do
    # Display a specific space
    # Maybe has a calender with available dates?
    # Maybe has a list of hyperlinks for available dates that
    # go to booking confirmation page
  end

  get 'spaces/:id/confirm' do
    # Booking confirmation page - neccessary?
  end

  post '/spaces/:id/confirm' do
    # 
  end


end
