class ListingsController < ApplicationController
  respond_to :json

  def index
    listings = paginate Listing.filter(filter_params(params)), per_page: 10
    feature_collection = generate_feature_collection(listings)
    render json: feature_collection
  end

  private

  def generate_feature_collection(listings)
    feature_collection = { "type" => "FeatureCollection", 
                           "features" => []
    }
    listings.each do |listing|
      feature_collection["features"] << GeoJSON.ar_to_geojson(listing)
    end
    feature_collection
  end

  def filter_params(params)
    params.slice(:min_price, :max_price, :min_bed, :max_bed, :min_bath, :max_bath)
  end
end
