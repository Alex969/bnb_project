require 'sinatra/base'
require 'sinatra/reloader'

require './lib/user'
require './lib/booking'
require './lib/listing'
require './lib/request'
require './lib/database_connection'

require 'pg'
require_relative './database_connection_setup'
require 'sinatra/flash'

class BnB < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'auth/register'
  end

  post '/register' do
    if User.unique(email: params[:email])
      User.sign_up(username: params[:username], email: params[:email], password: params[:password])
      session[:user] = User.login(email: params[:email], password: params[:password])
      redirect '/listings'
    else
      flash[:email] = "Error: Email already exists"
      redirect '/'
    end
  end

  get '/login' do
    erb :'auth/login'
  end

  post '/login' do
    email = params[:email]
    password = params[:password]
    if User.login(email: email, password: password)
      session[:user] = User.login(email: email, password: password)
      redirect '/listings'
    else
      flash[:nologin] = "Login failed, please try again."
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
      title: params[:title],
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

  post '/listings/view' do
    # Use params [:user_id] and [:booking_id] to INSERT INTO requests
    Request.create(booking_id: params[:booking_id], user_id: session[:user].id)
    flash[:notice] = "Your booking has been requested"
    redirect "/listings/#{params[:listing_id]}/view"
  end

  post '/requests' do
    # /:booking_id/confirm'
    flash[:approval_notice] = "Booking approved"
    Request.approve(user_id: params[:user_id], booking_id: params[:booking_id] )
    # Request.approve(user_id: params[:user_id], booking_id: params[:booking_id])
    # Collects params[:listing_id](inherently collects this in the path), session[:user].id, params[:date]
    redirect '/requests'
  end

  get '/requests' do
    redirect '/login' unless session[:user]
    @received_requests = Request.find(user_id: session[:user].id)
    # p @received_requests[2]['user_id']
    @pending_bookings = Request.all(user_id: session[:user].id)
    
    erb :'requests/display'
  end

  
end
