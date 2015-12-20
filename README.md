# opendoor-task
The api returns a filtered set of listings.

# Requirements
* rvm
* ruby-2.2.0
* rails 4.1.9
* postgresql

# Features
* Offers an API endpoint URL /listings.
* Supports filters like min_price, max_price, min_bed, max_bed, min_bath and max_bath as query parameters.
* API responds with valid GeoJSON. 
* Uses postgresql as the datastore.
* Supports pagination via web links.

# Installation

    bundle install # Installs gems from the Gemfile.
    bundle exec rake db:setup # creates database, loads schema and seeds the database.
    bundle exec rails s # runs the server on localhost.

# Further improvements
* Given a location, filter results within the vicinity of the location (within 5 miles, 10 miles etc).
* Filter results by a listing's status. 
