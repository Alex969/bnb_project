# frozen_string_literal: true

require 'user'

describe User do
  describe '.sign_up' do
    it 'should create a new User' do
      user = User.sign_up(username: 'Marianne', email: 'hello@example.com', password: 'password123')

      expect(user).to be_a User
      expect(user.username).to eq 'Marianne'
      expect(user.email).to eq 'hello@example.com'
    end
  end

  describe '.login' do
    it 'should login an existing user' do
      User.sign_up(username: 'Marianne', email: 'hello@example.com', password: 'password123')
      login = User.login(email: 'hello@example.com', password: 'password123')

      expect(login).to be_a User
      expect(login.username).to eq 'Marianne'
    end
    # Not testing for login fail due to authenticate method
  end

  describe '.authenticate' do

    it 'authenticates on correct user' do
      User.sign_up(username: 'Marianne', email: 'hello@example.com', password: 'password123')
      login = User.authenticate(email: 'hello@example.com', password: 'password123')

      expect(login).to eq true
    end

    it "doesn't authetnicate an incorrect user" do
      login = User.authenticate(email: 'hello@example.com', password: 'password123')

      expect(login).to eq false
    end
  end
end
