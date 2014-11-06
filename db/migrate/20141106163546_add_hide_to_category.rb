class AddHideToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :hide, :boolean
  end
end
