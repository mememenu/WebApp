class AddAttachmentAvatarToRestaurantHeaders < ActiveRecord::Migration
  def self.up
    change_table :restaurant_headers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :restaurant_headers, :avatar
  end
end
