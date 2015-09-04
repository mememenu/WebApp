class AddAttachmentToSpotlightItem < ActiveRecord::Migration
  def change
    change_table :spotlight_items do |t|
      t.attachment :avatar
    end
  end
end
