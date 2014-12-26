desc "Takes and saves a random dish"

task feed: :environment do 
  dish = Dish.take
  dish.gluten_free = true
  dish.save
  dish.gluten_free = nil
  dish.save
end