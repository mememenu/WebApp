class AddNameToTrackedEvents < ActiveRecord::Migration
  def change
    add_column :tracked_events, :name, :string
  end
end
