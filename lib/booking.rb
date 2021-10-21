# frozen_string_literal: true

class Booking
  attr_reader :id, :user_id, :listing_id, :date

  def initialize(user_id=nil,id:, listing_id:, date:)
    @id = id
    @user_id = user_id
    @listing_id = listing_id
    @date = date
  end

  def self.create(listing_id:, avail_from:, avail_to:)
    date_range(avail_from, avail_to).map do |date|
      query = DatabaseConnection.query('INSERT INTO bookings
      (listing_id, date) VALUES ($1, $2) 
      RETURNING id, listing_id, date;', [listing_id, date]).first
      Booking.new(id: query['id'], listing_id: query['listing_id'], date: query['date'])
    end
  end
  # This now returns an array of Booking objects for each of the bookings added into the booking table

  def self.available(listing_id:)
    query = DatabaseConnection.query('SELECT * FROM bookings WHERE listing_id=$1', [listing_id])

    all_bookings = query.map do |row|
      Booking.new(id: row['id'], listing_id: row['listing_id'], date: row['date'])
    end

    all_available_bookings = all_bookings.select { |booking| booking.user_id.nil? }
  end

  private

  def self.date_range(avail_from, avail_to)
    start_date_object = Date.parse(avail_from)
    end_date_object = Date.parse(avail_to)
    (start_date_object..end_date_object).map(&:to_s)
  end

end
