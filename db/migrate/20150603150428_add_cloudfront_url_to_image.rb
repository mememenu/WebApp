class AddCloudfrontUrlToImage < ActiveRecord::Migration
  def change
    add_column :images, :cloudfront_url, :string
  end
end
