class RenameCloudfrontInTiles < ActiveRecord::Migration
  def change
    rename_column :tiles, :cloud_front, :cloudfront_url
  end
end
