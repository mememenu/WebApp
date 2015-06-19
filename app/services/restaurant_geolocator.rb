class RestaurantGeolocator
  def self.call(ids = nil)
    counts = { success: 0, failed: 0 }

    if ids
      Restaurant.where(id: ids).each do |restaurant|
        if geolocate_restaurant(restaurant)
          counts[:success] += 1
        else
          counts[:failed] += 1
        end
      end
    else
      Restaurant.find_each do |restaurant|
        if geolocate_restaurant(restaurant)
          counts[:success] += 1
        else
          counts[:failed] += 1
        end
      end
    end

    counts
  end

  private

  def self.geolocate_restaurant(restaurant)
    restaurant.geocode
    if restaurant.latitude.present? && restaurant.longitude.present?
      restaurant.save
    end
  end
end
