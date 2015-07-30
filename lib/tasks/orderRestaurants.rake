desc "fills in place clean name column"

task orderPlaces: :environment do
  @places = Place.all.where(clean_name: nil)
  @places.each do |place|
    place.clean_name = place.name.gsub('The', '').split.join('')
    place.save
  end
end
