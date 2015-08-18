class AddHomePageIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :home_page_id, :integer
    add_index :lists, :home_page_id
  end
end
