require 'request'

describe Request do
  describe '.create' do
    it 'creates a request' do
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

      request_one = Request.create(booking_id: booking[0].id, user_id: user.id)
      request_two = Request.create(booking_id: booking[1].id, user_id: user.id)

      expect(request_one).to be_a Request
    end
  end

  describe '.find' do
    it ""
end
