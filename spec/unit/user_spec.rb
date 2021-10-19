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
    it 'should '
  end
end
