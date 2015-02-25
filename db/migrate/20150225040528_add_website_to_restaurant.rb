class AddWebsiteToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :website, :string
    add_column :restaurants, :photographer_name, :string
    add_column :restaurants, :photographer_media_link, :string
  end
end
