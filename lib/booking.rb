# frozen_string_literal: true

class Booking
  attr_reader :id, :user_id, :listing_id, :date

  def initialize(id:, user_id:, listing_id:, date:)
    @id = id
    @user_id = user_id
    @listing_id = listing_id
    @date = date
  end

  def self.create(listing_id:, avail_from:, avail_to:)
    date_range(avail_from, avail_to).each do |date|
      DatabaseConnection.query('INSERT INTO bookings(listing_id, date) VALUES ($1, $2)', [listing_id, date])
    end
  end

  def self.available(listing_id:)
    query = DatabaseConnection.query('SELECT * FROM bookings WHERE listing_id=$1', [listing_id])

    all_bookings = query.map do |row|
      Booking.new(id: row['id'], user_id: row['user_id'], listing_id: row['listing_id'], date: row['date'])
    end

    all_available_bookings = all_bookings.select { |booking| booking.user_id.nil? }
  end

  def self.date_range(avail_from, avail_to)
    start_date_object = Date.parse(avail_from)
    end_date_object = Date.parse(avail_to)
    (start_date_object..end_date_object).map(&:to_s)
  end

  # def self.request_booking(user_id:, listing_id:, date:)
  #   is_available?(listing_id: listing_id, date: date)
  #   send_owner_request(listing_id: listing_id, date: date)
  # end

  # def approve_booking(booking_id:)
  #   # connect to booking table and insert the user_id of person making booking to the booking.user_id
  #   Booking.new(id: id, user_id: user_id, listing_id: listing_id, date: date)
  # end

  # def self.is_available?(listing_id: listing_id, date: date)
  #   # connects to booking database and returns true if user_id is null
  # end

  # def send_owner_request(listing_id:, date:)

  # end
end
