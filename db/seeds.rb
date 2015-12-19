require 'csv'
listings = CSV.read("#{Rails.root}/db/seed_data/listings.csv", headers: true, 
                    converters: :all)
listings.each do |row|
  Listing.create!(row.to_h)
end
