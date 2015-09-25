class AddTrackedEvents < ActiveRecord::Migration
  def change
    create_table :tracked_events do |t|
      t.string :kind, null: false, index: true
      t.string :eventable_id, index: true
      t.string :eventable_type, index: true
      t.string :user_id
      t.string :ip

      t.timestamps
    end
  end
end
