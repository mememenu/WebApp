class UpdateTrackedEventsField < ActiveRecord::Migration
  def change
    remove_column :tracked_events, :eventable_id
    add_column :tracked_events, :eventable_id, :integer
  end
end
