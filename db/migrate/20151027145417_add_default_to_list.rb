class AddDefaultToList < ActiveRecord::Migration
  def change
    add_column :lists, :default, :boolean
  end
end
