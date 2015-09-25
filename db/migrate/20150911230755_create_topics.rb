class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false, index: true
      t.references :topicable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
