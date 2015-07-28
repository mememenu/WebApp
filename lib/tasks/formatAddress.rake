desc "Creates a pre formatted string containing the exact url needed to access google maps"

task formatAddress: :environment do
  places = Place.all
  places.each do |place|
    if place.maps_url.class != String
      formatted_address_1 = place.address_1.split.join('+')
      formatted_city = place.city.split.join('+') + "+" + place.state + "+" + place.zipcode
      place.maps_url = "https://www.google.com/maps/place/" + formatted_address_1 + ",+" + formatted_city
      place.save
    end
  end
end
