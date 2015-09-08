class Api::V1::Place::SearchSerializer < Api::V1::PlaceSerializer
  attributes :location, :price, :zone, :status

  has_one :banner

  def location
    [object.latitude, object.longitude]
  end
end
