RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
      expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  require 'factory_girl_rails'
  config.include FactoryGirl::Syntax::Methods
end

def seed_test_db
  listings = [
    {id: 0, price: 299727, bedrooms: 4, bathrooms: 1},
    {id: 1, price: 123081, bedrooms: 5, bathrooms: 3},
    {id: 2, price: 172219, bedrooms: 5, bathrooms: 2},
    {id: 3, price: 224414, bedrooms: 3, bathrooms: 1},
    {id: 4, price: 116829, bedrooms: 2, bathrooms: 1}
  ]
  listings.each do |listing|
    create(:listing, listing)
  end
end
