# frozen_string_literal: true

require 'booking'

describe Booking do
  describe '.create' do
    it 'creates a booking' do
      user = User.sign_up(
        username: 'test',
        email: 'test@test.com',
        password: 'password'
      )
      listing = Listing.create(
        title: 'Cottage Heaven',
        description: 'My cottage in the woods',
        price_per_night: 50,
        user_id: user.id
      )
      date_one = '2021-01-01'
      date_two = '2021-01-03'
      booking = Booking.create(listing_id: listing.id, avail_from: date_one, avail_to: date_two)

      expect(booking).to be_a Array
      expect(booking.length).to eq 3
      expect(booking).to include date_one
      expect(booking).to include date_two
    end
  end
end
