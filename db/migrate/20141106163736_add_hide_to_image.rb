class AddHideToImage < ActiveRecord::Migration
  def change
    add_column :images, :hide, :boolean
  end
end
