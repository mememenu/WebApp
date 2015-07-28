class PlaceGeolocator
  def self.call(ids = nil)
    counts = { success: 0, failed: 0 }

    if ids
      Place.where(id: ids).each do |place|
        if geolocate_place(place)
          counts[:success] += 1
        else
          counts[:failed] += 1
        end
      end
    else
      Place.find_each do |place|
        if geolocate_place(place)
          counts[:success] += 1
        else
          counts[:failed] += 1
        end
      end
    end

    counts
  end

  private

  def self.geolocate_place(place)
    place.geocode
    if place.latitude.present? && place.longitude.present?
      place.save
    end
  end
end
