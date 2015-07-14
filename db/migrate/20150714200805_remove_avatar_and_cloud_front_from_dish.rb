class RemoveAvatarAndCloudFrontFromDish < ActiveRecord::Migration
  def change
    change_table :dishes do |t|
      t.remove :avatar_file_name
      t.remove :avatar_content_type
      t.remove :avatar_file_size
      t.remove :avatar_updated_at
      t.remove :cloud_front
    end
  end
end
