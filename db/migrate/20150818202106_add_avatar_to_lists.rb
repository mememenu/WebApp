class AddAvatarToLists < ActiveRecord::Migration
  def change
    add_attachment :lists, :avatar
  end
end
