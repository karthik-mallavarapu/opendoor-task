module GeoJSON

  def self.ar_to_geojson(listing)
    feature = {
      "type" => "Feature",
      "geometry" => { "type" => "Point", "coordinates" => 
                      [listing.lng.to_s.to_f, listing.lat.to_s.to_f] },
      "properties" => listing.attributes.slice("id", "price", "street", 
                                               "bedrooms", "bathrooms", "sq_ft")
    }
    feature
  end
end
