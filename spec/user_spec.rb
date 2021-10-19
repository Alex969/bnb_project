# frozen_string_literal: true

require 'user'

describe User do
  describe '.sign_up' do
    it 'should create a new User' do
      user = User.sign_up(name: 'Hello', email: 'hello@example.com', password: 'password123')

      expect(user).to be_a User
    end
  end
end
