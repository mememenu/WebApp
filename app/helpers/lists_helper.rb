module ListsHelper
  def eligible_places(list)
    places = Place.unhidden
    places = places.not_in_list(list) unless list.new_record?

    places
  end
end
