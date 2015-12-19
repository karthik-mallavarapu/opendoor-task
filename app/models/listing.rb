class Listing < ActiveRecord::Base
  scope :min_price, -> (min_price) { where('price >= ?', min_price) }
  scope :max_price, -> (max_price) { where('price <= ?', max_price) }
  scope :min_bed, -> (min_bed) { where('bedrooms >= ?', min_bed) }
  scope :max_bed, -> (max_bed) { where('bedrooms <= ?', max_bed) }
  scope :min_bath, -> (min_bath) { where('bathrooms >= ?', min_bath) }
  scope :max_bath, -> (max_bath) { where('bathrooms <= ?', max_bath) }

  def self.filter(params)
    listings = Listing.where(nil)
    params.each do |param, val|
      listings = listings.send(param, val)
    end
    listings
  end
end
