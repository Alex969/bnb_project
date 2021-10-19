# frozen_string_literal: true

class User
  attr_reader :id, :name, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.sign_up(name:, email:, password:)
    User.new(id: id, username: username, email: email, password: password)
  end
end
