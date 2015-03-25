desc "Iterates over every restaurant tile and create a cloud front url"

task restaurant_tiles_cloud_front: :environment do 
  tiles = RestaurantTile.all
  tiles.each do |tile|
    if tile.cloud_front.class != String
      tile.cloud_front = tile.avatar.url.gsub('http://s3.amazonaws.com/meme-menu', 'http://dm7g4xbxa7ld3.cloudfront.net')
      tile.save
    end
  end
end