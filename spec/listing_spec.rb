# frozen_string_literal: true

require 'listing'

describe Listing do
  describe '.create' do
    it 'should create a new Listing' do
      listing = Listing.create(name: 'Cottage Heaven', description: 'My cottage in the woods', price: 50,
                               available_date: 18 / 10 / 2021)

      expect(listing).to be_a Listing
    end
  end

  describe '.all' do
    xit 'should list all listings' do
      Listing.create(name: 'Cottage Heaven', description: 'My cottage in the woods', price: 50,
                     available_date: 18 / 10 / 2021)
      Listing.create(name: 'Cottage Hell', description: 'My cottage in the fire', price: 100,
                     available_date: 19 / 10 / 2021)
      list = Listing.all
      expect(list).to include 'Cottage Heaven'
      expect(list).to include 'Cottage Hell'
      expect(list.length).to eq 2
    end
  end
end
