class RemoveDisplayFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :display_name, :string
  end
end
