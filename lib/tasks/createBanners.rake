desc "One time use task to create empty restaurant banners for all restaurants"

task feed: :environment do 
  Restaurant.all.each do |restaurant|
    RestaurantBanner.create(restaurant_id: restaurant.id)
  end
end