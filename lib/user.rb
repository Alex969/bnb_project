# frozen_string_literal: true

require 'bcrypt'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.sign_up(username:, email:, password:)
    encrypted = encrypt(password)
    query = DatabaseConnection.query("INSERT INTO users (username, email, password)
    VALUES($1, $2, $3) RETURNING id, username, email;", [username, email, encrypted]).first
    User.new(id: query['id'], username: query['username'], email: query['email'])
  end

  def self.login(email:, password:)
    query = DatabaseConnection.query(
      "SELECT *
      FROM users
      WHERE email = $1
      ;", [email]
    ).first
    return false if query == nil
    if decrypt(query['password']) == password
      User.new(id: query['id'], username: query['username'], email: query['email'])
    else
      return false
    end
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

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.decrypt(e_password)
    BCrypt::Password.new(e_password)
  end

end
