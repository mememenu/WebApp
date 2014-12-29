class AddAttachmentAvatarToRestaurantTiles < ActiveRecord::Migration
  def self.up
    change_table :restaurant_tiles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :restaurant_tiles, :avatar
  end
end
