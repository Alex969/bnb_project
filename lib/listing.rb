# frozen_string_literal: true

class Listing
  attr_reader :name, :description, :price, :available_date

  def initialize(name:, description:, price:, available_date:)
    @name = name
    @description = description
    @price = price
    @available_date = available_date
  end

  def self.create(name:, description:, price:, available_date:)
    # create object in database and wrap in below
    Listing.new(name: name, description: description, price: price, available_date: available_date)
  end

  def self.all
    # access the database for all listings and select all
  end
end
