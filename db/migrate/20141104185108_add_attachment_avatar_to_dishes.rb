class AddAttachmentAvatarToDishes < ActiveRecord::Migration
  def self.up
    change_table :dishes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :dishes, :avatar
  end
end
