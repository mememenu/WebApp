class Api::V1::Place::NearbySerializer < Api::V1::PlaceSerializer
  attributes :distance

  def distance
    object.distance_to(serialization_options[:sent_location])
  end
end
