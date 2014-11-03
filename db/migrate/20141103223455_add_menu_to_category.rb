class AddMenuToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :menu, index: true
  end
end
