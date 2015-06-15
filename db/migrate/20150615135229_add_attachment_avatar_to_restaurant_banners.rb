class AddAttachmentAvatarToRestaurantBanners < ActiveRecord::Migration
  def self.up
    change_table :restaurant_banners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :restaurant_banners, :avatar
  end
end
