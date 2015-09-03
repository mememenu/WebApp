class Api::V1::Place::ShowSerializer < Api::V1::PlaceSerializer
  attributes :zone, :header, :formatted_phone, :location, :full_address, :price,
             :google_id, :foursquare_id

  has_many :menus, serializer: Api::V1::MenuSerializer
  has_one :header

  def location
    [object.latitude, object.longitude]
  end

  def menus
    object.menus.unhidden
  end
end
