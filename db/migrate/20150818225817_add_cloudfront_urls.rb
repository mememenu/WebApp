class AddCloudfrontUrls < ActiveRecord::Migration
  def change
    add_column :banners, :cloudfront_url, :string
    add_column :headers, :cloudfront_url, :string
    add_column :lists, :cloudfront_url, :string
    add_column :places, :cloudfront_url, :string
    add_column :spotlight_items, :cloudfront_url, :string
  end
end
