class AddGenreToCuisine < ActiveRecord::Migration
  def change
    add_column :cuisines, :genre, :string
  end
end
