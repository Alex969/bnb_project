# frozen_string_literal: true

require 'listing'

describe Listing do
  describe '.create' do
    it 'should create a new Listing' do
      listing = Listing.create(
        title: 'Cottage Heaven',
        description: 'My cottage in the woods',
        price_per_night: 50,
        user_id: 1
      )
      expect(listing).to be_a Listing
      expect(listing.title).to eq 'Cottage Heaven'
    end
  end

  describe '.all' do
    it 'should list all listings' do
      cottage_heaven = Listing.create(
        title: 'Cottage Heaven',
        description: 'My cottage in the woods',
        price_per_night: 50,
        user_id: 1
      )
      cottage_hell = Listing.create(
        title: 'Cottage Hell',
        description: 'My cottage in the fire',
        price_per_night: 100,
        user_id: 1
      )
      list = Listing.all
      expect(list.length).to eq 2
      expect(cottage_heaven.title).to eq list[0].title
      expect(cottage_heaven.description).to eq list[0].description
      expect(cottage_heaven.price_per_night).to eq list[0].price_per_night
      expect(cottage_heaven.user_id).to eq list[0].user_id
    end
  end
end
