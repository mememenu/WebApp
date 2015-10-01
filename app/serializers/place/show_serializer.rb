class Place::ShowSerializer < PlaceSerializer
  attributes :header, :formatted_phone, :location, :full_address, :price,
             :google_id, :foursquare_id, :quotes, :phone, :website, :facebook,
             :twitter, :instagram

  has_many :menus, serializer: MenuSerializer
  has_one :header

  def location
    [object.latitude, object.longitude]
  end

  def menus
    object.menus.unhidden
  end
end
