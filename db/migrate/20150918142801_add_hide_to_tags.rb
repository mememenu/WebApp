class AddHideToTags < ActiveRecord::Migration
  def change
    add_column :tags, :hide, :boolean
  end
end
