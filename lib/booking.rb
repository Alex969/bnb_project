# frozen_string_literal: true

class Booking
  attr_reader :listing, :date

  def initialize(listing:, date:)
    @listing = listing
    @date = date
  end

  def self.request_booking(listing:, date:)
    is_available?
    Booking.new(listing: listing, date: date)
  end

  def approve_booking(booking)
    # connect to booking table and insert the user_id of person making booking to the booking.user_id
  end

  def self.is_available?
    # connects to booking database and returns true if user_id is null
  end
end
