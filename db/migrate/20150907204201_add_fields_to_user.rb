class AddFieldsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :gender
      t.string :locale
      t.string :first_name
      t.string :last_name
    end
  end
end
