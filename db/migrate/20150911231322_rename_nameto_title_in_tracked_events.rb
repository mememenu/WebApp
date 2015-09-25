class RenameNametoTitleInTrackedEvents < ActiveRecord::Migration
  def change
    rename_column :tracked_events, :name, :title
  end
end
