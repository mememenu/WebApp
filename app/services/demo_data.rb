class DemoData
  def self.call
    Place.where(zipcode: '12345').destroy_all
    Event.destroy_all
    SpotlightItem.destroy_all
    Spotlight.destroy_all
    List.destroy_all
    HomePage.destroy_all
    Topic.destroy_all

    seed_topic_view_events

    FactoryGirl.create(:place_with_menus_and_categories, name: "Full Place")
    FactoryGirl.create(:home_page)
  end

  def self.seed_topic_view_events
    FactoryGirl.create_list(:place_name_topic, 3)
    FactoryGirl.create_list(:place_zone_topic, 3)
    FactoryGirl.create_list(:tag_name_topic, 2)
  end
end
