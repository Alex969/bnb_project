class Request
 
  attr_reader :id, :booking_id, :user_id

  def initialize(id:, booking_id:, user_id:)
    @id = id
    @booking_id = booking_id
    @user_id = user_id
  end


  def self.create(booking_id:, user_id:)
    query = DatabaseConnection.query("INSERT INTO requests (booking_id, user_id) VALUES($1, $2) RETURNING id, booking_id, user_id;", [booking_id, user_id]).first
    Request.new(id: query['id'], booking_id: query['booking_id'], user_id: query['user_id'])
  end


  def self.find(user_id:)
    query = DatabaseConnection.query(
      "select bookings.date, users.username, users.id AS user_id, bookings.id AS booking_id, listings.title, listings.id AS listing_id from requests 
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

  def self.find_confirmed(user_id:)
    query = DatabaseConnection.query(
      "select * from bookings 
      inner join listings
      on bookings.listing_id = listings.id
      inner join users 
      on listings.user_id = users.id
      where bookings.user_id = $1;", [user_id]
    )
    query.map { |hash| hash }
  end

  def self.all(user_id:)
    query = DatabaseConnection.query("SELECT listings.title, listings.id, bookings.date
      FROM requests
      INNER JOIN bookings 
      ON requests.booking_id = bookings.id
      INNER JOIN listings
      ON bookings.listing_id = listings.id
      WHERE requests.user_id = $1;", [user_id])
    query.map do | pending_booking |
      pending_booking
    end
  end   
  
  def self.approve(user_id:, booking_id:)
    DatabaseConnection.query("UPDATE bookings SET user_id = $1 WHERE id = $2;",[user_id, booking_id])
    DatabaseConnection.query("DELETE from requests WHERE booking_id = $1;", [booking_id])

  end
end

