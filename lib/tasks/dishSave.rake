desc "Iterates over every dish and swaps their url for one with a cloudfront url"

task dishSave: :environment do 
  dishes = Dish.all
  dishes.each do |dish|
    dish.cloud_front = dish.avatar.url.gsub('http://s3.amazonaws.com/meme-menu', 'dm7g4xbxa7ld3.cloudfront.net').gsub('original', 'large')
    dish.save
    puts dish.cloud_front
  end
end