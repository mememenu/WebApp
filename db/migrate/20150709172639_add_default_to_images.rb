class AddDefaultToImages < ActiveRecord::Migration
  def change
    add_column :images, :default, :boolean
  end
end
