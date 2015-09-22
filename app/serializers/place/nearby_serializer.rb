class Place::NearbySerializer < PlaceSerializer
  attributes :distance

  def distance
    object.distance_to(serialization_options[:sent_location])
  end
end
