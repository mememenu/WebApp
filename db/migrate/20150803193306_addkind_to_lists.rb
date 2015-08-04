class AddkindToLists < ActiveRecord::Migration
  def change
    add_column :lists, :kind, :string, index: true
  end
end
