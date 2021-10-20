# frozen_string_literal: true

class Listing
  attr_reader :id, :title, :description, :price_per_night, :user_id

  def initialize(id:, title:, description:, price_per_night:, user_id:)
    @id = id
    @title = title
    @description = description
    @price_per_night = price_per_night
    @user_id
  end

  def self.create(title:, description:, price_per_night:, avail_from:, avail_to:, user_id:)
    query = DatabaseConnection.query("INSERT INTO listings 
    (title, description, price_per_night) VALUES($1, $2, $3) 
    RETURNING id, title, description, price_per_night, user_id;",[title, description, price_per_night]
  ).first
    Listing.new(
      id: query['id'],
      title: query['title'],
      description: query['description'],
      price_per_night: query['price_per_night'],
      user_id: query['user_id']
    )
    # booking_query = DatabaseConnection.query("INSERT INTO bookings (")
     # availto - availfrom .times create Booking instance until index reaches limit - availfrom +1 being the date.
  end

 
  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings")
    result.map do |listing|
      Listing.new(
        id: listing['id'],
        title: listing['title'],
        description: listing['description'],
        price_per_night: listing['price_per_night'],
        user_id: listing['user_id']
      )
    end
  end

  def self.find(id)
    query = DatabaseConnection.query(
      "SELECT * FROM listings
      WHERE id = $1", [id]
    ).first
    Listing.new(
      id: query['id'],
      title: query['title'],
      description: query['description'],
      price_per_night: query['price_per_night'],
      user_id: query['user_id']
    )
  end
end
