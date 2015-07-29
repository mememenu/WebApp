desc "Rename aws paths from restaurant to places"

namespace :mememenu do
  task rename_restaurant_aws_paths: :environment do
    s3 = AWS::S3.new(access_key_id: 'AKIAILKXHA63C3N74VJA',
                     secret_access_key: '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')

    bucket = s3.buckets[ENV['AWS_BUCKET_NAME']]

    bucket.objects.with_prefix("restaurants/").each do |obj|
      obj.copy_to(obj.key.gsub("restaurants/", "places/"))
    end

    bucket.objects.with_prefix("restaurant_tiles/").each do |obj|
      obj.copy_to(obj.key.gsub("restaurant_tiles/", "tiles/"))
    end

    bucket.objects.with_prefix("restaurant_headers/").each do |obj|
      obj.copy_to(obj.key.gsub("restaurant_headers/", "headers/"))
    end

    bucket.objects.with_prefix("restaurant_banners/").each do |obj|
      obj.copy_to(obj.key.gsub("restaurant_banners/", "banners/"))
    end
  end
end
