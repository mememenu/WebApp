desc "Refresh cloudfront_url for image"

namespace :mememenu do
  task refresh_cloudfront_url: :environment do
    Tile.where(cloudfront_url: nil).map(&:save)
    Image.where(cloudfront_url: nil).map(&:save)
    Banner.where(cloudfront_url: nil).map(&:save)
    Header.where(cloudfront_url: nil).map(&:save)
    Place.where(cloudfront_url: nil).map(&:save)
  end
end
