require 'rails_helper'

describe Listing, type: :model do
  before do
    seed_test_db
  end

  context "filters based on price" do
    context "min_price filter" do
      it "filters listings with a min_price filter" do
        listings = Listing.min_price(200000)
        expect(listings.count).to eq 2
      end

      it "filters listings with params inclusive" do
        listings = Listing.min_price(299727)
        expect(listings.count).to eq 1
      end
    end

    context "max_price filter" do
      it "filters listings with a max_price filter" do
        listings = Listing.max_price(200000)
        expect(listings.count).to eq 3
      end

      it "filters listings with params inclusive" do
        listings = Listing.max_price(116829)
        expect(listings.count).to eq 1
      end
    end

    context "min_bed filter" do
      it "filters listings with a min_bed filter" do
        listings = Listing.min_bed(4)
        expect(listings.count).to eq 3
      end
    end

    context "max_bed filter" do
      it "filters listings with a max_bed filter" do
        listings = Listing.max_bed(4)
        expect(listings.count).to eq 3
      end
    end

    context "min_bath filter" do
      it "filters listings with a min_bath filter" do
        listings = Listing.min_bath(2)
        expect(listings.count).to eq 2
      end
    end

    context "max_bath filter" do
      it "filters listings with a max_bath filter" do
        listings = Listing.max_bath(2)
        expect(listings.count).to eq 4
      end
    end
  end

  describe '#filter' do
    it "filters listings based on price and bath" do
      params = {min_price: 200000, min_bath: 3}
      expect(Listing.filter(params).count).to eq 0
    end

    it "filters listings based on price and bedrooms" do
      params = {min_price: 200000, min_bed: 4}
      expect(Listing.filter(params).count).to eq 1
    end

    it "filters listings based on bedrooms and bath" do
      params = {max_bed: 4, min_bath: 1}
      expect(Listing.filter(params).count).to eq 3
    end
  end

end
