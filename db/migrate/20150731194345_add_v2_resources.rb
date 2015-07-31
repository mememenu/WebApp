class AddV2Resources < ActiveRecord::Migration
  def change
    create_table :spotlight_items do |t|
      t.belongs_to :spotlight, index: true
      t.belongs_to :spotable, polymorphic: true, index: true
      t.integer    :position

      t.timestamps null: false
    end

    create_table :spotlights do |t|
      t.timestamps null: false
    end

    create_table :lists do |t|
      t.string :name, null: false
      t.boolean :hide, default: true, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    create_table :lists_places, id: false do |t|
      t.belongs_to :place, index: true
      t.belongs_to :list, index: true
    end

    create_table :events do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :reservations, default: false, null: false
      t.boolean :hide, default: true, null: false
      t.float :price
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.belongs_to :place, index: true

      t.timestamps null: false
    end
  end
end
