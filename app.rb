require 'sinatra/base'
require 'sinatra/reloader'

require './lib/user'
require './lib/booking'
require './lib/listing'
require './lib/database_connection'

require 'pg'
require_relative './database_connection_setup'
require 'sinatra/flash'

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
      redirect '/listings'
    else
      redirect '/login'
    end
  end

  get '/listings' do
    @username = session[:user].username if session[:user]
    @all_listings = Listing.all
    erb :'listings/all'
  end

  get '/listings/create' do
    erb :'listings/create'
  end

  post '/listings/create' do
    listing = Listing.create(
      title: params[:name],
      description: params[:description],
      price_per_night: params[:price],
      user_id: session[:user].id
    )
    Booking.create(
      listing_id: listing.id,
      avail_from: params[:avail_from],
      avail_to: params[:avail_to]
    )
    redirect '/listings'
  end

  get '/listings/:listing_id/view' do
    redirect '/login' unless session[:user]
    @current_user = session[:user]
    @current_listing = Listing.find(params[:listing_id])
    @available_dates = Booking.available(listing_id: params[:listing_id])
    erb :'listings/view'
  end

  get 'listings/:listing_id/confirm' do
    # Booking confirmation page - neccessary?
    # erb :'booking/summary'
  end

  post '/listings/:listing_id/confirm' do
    # Collects params[:listing_id](inherently collects this in the path), session[:user].id, params[:date]
  end

  get '/listings' do
    # Displays list of requests made ->
    # Displays list of requests receieved
    # erb :'requests/display'
  end
end
