class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :display_name
      t.text :description
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
