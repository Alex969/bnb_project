# frozen_string_literal: true

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.sign_up(username:, email:, password:)
    query = DatabaseConnection.query("INSERT INTO users (username, email, password)
    VALUES($1, $2, $3) RETURNING id, username, email;", [username, email, password]).first
    User.new(id: query['id'], username: query['username'], email: query['email'])
  end

  def self.login(email:, password:)
    query = DatabaseConnection.query(
      "SELECT *
      FROM users
      WHERE email = $1 AND password = $2
      ;", [email, password]
    ).first
    User.new(id: query['id'], username: query['username'], email: query['email'])
  end

  def self.authenticate(email:, password:)
    query = DatabaseConnection.query(
      "SELECT EXISTS (
        SELECT *
        FROM users
        WHERE email = $1 AND password = $2
      );", [email, password]
    ).first
    query['exists'] == 't'
  end

  def self.unique(email:)
    query = DatabaseConnection.query(
      "SELECT EXISTS (
        SELECT *
        FROM users
        WHERE email = $1
      );", [email]
    ).first
    query['exists'] == 'f'
  end

end
