class DemoData
  def self.call
    Place.destroy_all
    Event.destroy_all
    SpotlightItem.destroy_all
    List.destroy_all

    FactoryGirl.create(:spotlight, :with_items)
    FactoryGirl.create(:featured_list, :with_places)
    FactoryGirl.create_list(:home_page_list, 6, :with_places)
  end
end
