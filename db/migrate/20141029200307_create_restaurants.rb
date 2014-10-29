class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :description
      t.string :phone
      t.integer :dollars
      t.boolean :reservations

      t.timestamps
    end
  end
end
