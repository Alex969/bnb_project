# frozen_string_literal: true

require 'listing'

describe Listing do
  describe '.create' do
    it 'should create a new Listing' do
      # user = double ('user' user_id: 1)
      listing = Listing.create(title: 'Cottage Heaven', description: 'My cottage in the woods', price_per_night: 50, avail_from: 18 / 10 / 2021, avail_to: 20 / 10 / 2021, user_id: 1)
      expect(listing).to be_a Listing
      expect(listing.title).to eq 'Cottage Heaven'
    end
  end

  describe '.all' do
    xit 'should list all listings' do
      Listing.create(title: 'Cottage Heaven', description: 'My cottage in the woods', price_per_night: 50, available_date: 18 / 10 / 2021)
      Listing.create(title: 'Cottage Hell', description: 'My cottage in the fire', price_per_night: 100,
                     available_date: 19 / 10 / 2021)
      list = Listing.all
      expect(list).to include 'Cottage Heaven'
      expect(list).to include 'Cottage Hell'
      expect(list.length).to eq 2
    end
  end

  describe ''
end
