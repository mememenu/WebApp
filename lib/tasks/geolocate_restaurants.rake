namespace :mememenu do
  desc "Get coordinates for all restaurants using Geocoder wit Google API"

  task :geolocate_restaurants, [:ids] => :environment do |task, args|
    restaurant_ids = args[:ids].split(' ') if args[:ids]

    if restaurant_ids
      puts "----- Geolocating restaurants with ids #{args[:ids]}... -----"
    else
      puts "----- Geolocating all restaurants... -----"
    end

    counts = RestaurantGeolocator.call(restaurant_ids)

    puts "----- Sucessfull geolocated restaurants: #{counts[:success]} -----"
    puts "----- Restaurants failed to geolocate: #{counts[:failed]} -----"
  end
end
