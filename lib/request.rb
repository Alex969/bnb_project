class Request

  def initialize(booking_id:, user_id:)

  end


  def self.create(booking_id:, user_id:)
    Request.new(booking_id: booking_id, user_id: user_id)
  end

end