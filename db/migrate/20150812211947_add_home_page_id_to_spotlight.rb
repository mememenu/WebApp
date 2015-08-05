class AddHomePageIdToSpotlight < ActiveRecord::Migration
  def change
    add_column :spotlights, :home_page_id, :integer
    add_index :spotlights, :home_page_id
  end
end
