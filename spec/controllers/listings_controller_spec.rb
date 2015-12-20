require 'rails_helper'

describe ListingsController, type: :controller do
  before do
    seed_test_db
  end

  context "responds with geojson" do
    before {
      get :index
      @response = JSON.parse(response.body)
    }

    it "feature collection" do
      expect(@response["type"]).to eq "FeatureCollection"
    end

    it "records as array of features" do
      expect(@response["features"].class.to_s).to eq "Array"
    end

    it "feature including a set of coordinates" do
      expect(@response["features"][0]["geometry"]["coordinates"]).
                                  to eq [-112.119714698439, 33.3694442083416]
    end

    it "object attributes as properties" do
      expect(@response["features"][0]["properties"].keys).to eq ["id", "price", 
                                     "street", "bedrooms", "bathrooms", "sq_ft"]
    end
  end

  it "renders all listings without any params" do
    get :index
    listings = JSON.parse(response.body)["features"]
    expect(listings.count).to eq 5
  end

  context "filters listings based on" do
    it "minimum price" do
      get :index, min_price: 200000
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 2
    end

    it "maximum price" do
      get :index, max_price: 200000
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 3
    end

    it "minimum bed" do
      get :index, min_bed: 4
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 3
    end

    it "maximum bed" do
      get :index, max_bed: 4
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 3
    end

    it "minimum bath" do
      get :index, min_bath: 2
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 2
    end

    it "maximum bath" do
      get :index, max_bath: 2
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 4
    end

    it "multiple params without any hits" do
      get :index, min_price: 200000, min_bed: 3, min_bath: 2
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 0
    end

    it "multiple params matching all records" do
      get :index, min_price: 100000, min_bed: 2, min_bath: 1
      listings = JSON.parse(response.body)["features"]
      expect(listings.count).to eq 5
    end
  end
end
