# frozen_string_literal: true

class Listing
  attr_reader :id, :name, :description, :price_per_night, :available_date, :user_id

  def initialize(id:, title:, description:, price_per_night:, available_date:, user_id:)
    @id = id
    @title = title
    @description = description
    @price_per_night = price_per_night
    @available_date = available_date
    @user_id
  end

  def self.create(id:, title:, description:, price_per_night:, available_date:, user_id:)
    # PG.connect.. INSTERT listings id titlel.... Returning id tile len
    Listing.new(id: id, title: title, description: description, price_per_night: price_per_night, available_date: available_date, user_id: user_id)
    INSERT INTO bookings 
  end

  def self.all
    # access the database for all listings and select all
  end
end
