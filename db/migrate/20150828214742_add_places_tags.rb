class AddPlacesTags < ActiveRecord::Migration
  def change
    create_table :places_tags, id: false do |t|
      t.belongs_to :place, index: true
      t.belongs_to :tag, index: true
    end
  end
end
