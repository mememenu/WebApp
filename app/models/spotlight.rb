class Spotlight < ActiveRecord::Base
  has_many :spotlight_items
  belongs_to :home_page

  def available_places
    used_places = spotlight_items.where(spotable_type: "Place").pluck(:spotable_id)
    Place.unhidden.where.not(id: used_places)
  end

  def available_lists
    used_lists = spotlight_items.where(spotable_type: "List").pluck(:spotable_id)
    List.unhidden.generic_lists.where.not(id: used_lists)
  end

  def available_items
    available_lists + available_places
  end
end
