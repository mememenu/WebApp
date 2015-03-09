class AddCloudFrontToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :cloud_front, :string
  end
end
