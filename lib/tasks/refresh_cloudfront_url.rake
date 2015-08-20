desc "Refresh cloudfront_url for image"

namespace :mememenu do
  task refresh_cloudfront_url: :environment do
    Tile.find_each do |tile|
      tile.cloudfront_url = nil
      tile.save
    end

    Image.find_each do |image|
      image.cloudfront_url = nil
      image.save
    end
  end
end
