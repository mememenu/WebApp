class AddQuotesToPlace < ActiveRecord::Migration
  def change
    add_column :places, :quotes, :text
  end
end
