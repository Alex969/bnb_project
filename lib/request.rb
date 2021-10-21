class Request

  def initialize(booking_id:, user_id:)

  end


  def self.create(booking_id:, user_id:)
    Request.new(booking_id: booking_id, user_id: user_id)
  end

  def self.find(user_id:)
    query = DatabaseConnection.query(
      "select bookings.date, users.username, listings.title from requests 
      inner join bookings 
      on requests.booking_id = bookings.id
      inner join listings
      on bookings.listing_id = listings.id
      inner join users 
      on requests.user_id = users.id 
      where listings.user_id = $1;", [user_id]
    )
    query.map { |hash| hash }
  end
end
