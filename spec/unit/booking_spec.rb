# frozen_string_literal: true

require 'booking'

describe Booking do
  describe '.request_booking' do
    xit 'should request booking' do
      listing = double('listing')
      booking = Booking.request_booking(listing: listing, date: 18 / 10 / 2021)

      expect(booking).to be_a Booking
    end
  end

  describe '.approve_booking' do
    xit 'should approve a valid booking' do
      # connect to database - booking table
      listing = double('listing')
      booking = Booking.request_booking(listing: listing, date: 18 / 10 / 2021)
      approve_booking(booking)
      # expect booking table to have user_id not null (user id should be the id of person making booking)
    end
  end

  describe '.available' do
    # We need user id, listing id 
#     Booking.available(listing id)
# expecting an array of Booking objects with no user id
  end
