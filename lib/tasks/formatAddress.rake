desc "Creates a pre formatted string containing the exact url needed to access google maps"

task formatAddress: :environment do 
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    if restaurant.maps_url.class != String
      formatted_address_1 = restaurant.address_1.split.join('+')
      formatted_city = restaurant.city.split.join('+') + "+" + restaurant.state + "+" + restaurant.zipcode
      restaurant.maps_url = "https://www.google.com/maps/place/" + formatted_address_1 + ",+" + formatted_city
      restaurant.save
    end
  end
end