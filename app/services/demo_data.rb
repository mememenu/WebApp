class DemoData
  def self.call
    Place.where(zipcode: '12345').destroy_all
    Event.destroy_all
    SpotlightItem.destroy_all
    Spotlight.destroy_all
    List.destroy_all
    HomePage.destroy_all

    FactoryGirl.create(:home_page)
  end
end
