desc "fills in restaurant clean name column"

task orderRestaurants: :environment do 
  @restaurants = Restaurant.all.where(clean_name: nil)
  @restaurants.each do |restaurant|
    restaurant.clean_name = restaurant.name.gsub('The', '').split.join('')
    restaurant.save
  end
end