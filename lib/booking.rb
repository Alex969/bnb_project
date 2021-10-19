# frozen_string_literal: true

class Booking
  attr_reader :id, :user_id, :listing_id, :date

  def initialize(id:, user_id:, listing_id:, date:)
    @id = id
    @user_id = user_id
    @listing_id = listing_id
    @date = date
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
