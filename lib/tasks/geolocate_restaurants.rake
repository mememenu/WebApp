namespace :mememenu do
  desc "Get coordinates for all places using Geocoder wit Google API"

  task :geolocate_places, [:ids] => :environment do |task, args|
    place_ids = args[:ids].split(' ') if args[:ids]

    if place_ids
      puts "----- Geolocating places with ids #{args[:ids]}... -----"
    else
      puts "----- Geolocating all places... -----"
    end

    counts = PlaceGeolocator.call(place_ids)

    puts "----- Sucessfull geolocated places: #{counts[:success]} -----"
    puts "----- Places failed to geolocate: #{counts[:failed]} -----"
  end
end
