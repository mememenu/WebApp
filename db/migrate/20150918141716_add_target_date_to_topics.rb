class AddTargetDateToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :target_date, :datetime, null: false, index: true
  end
end
