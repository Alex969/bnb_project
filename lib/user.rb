# frozen_string_literal: true

class User
  attr_reader :id, :name, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.sign_up(username:, email:, password:)
    query = DatabaseConnection.query("INSERT INTO users(username, email, password)
    VALUES($1, $2, $3) RETURNING id, username, email;",[name, email, password]).first
    User.new(id: query['id'], username: query['username'], email: query['email'])
  end

  def self.login(email:, password:)
    # SQL query to check email against password

  end
end
