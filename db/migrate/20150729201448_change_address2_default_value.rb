class ChangeAddress2DefaultValue < ActiveRecord::Migration
  def change
    change_column_default :places, :address_2, ""
  end
end
