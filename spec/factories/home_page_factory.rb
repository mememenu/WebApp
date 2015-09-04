FactoryGirl.define do
  factory :home_page do
    association :spotlight, factory: [:spotlight, :with_items]
    association :featured_list, factory: [:featured_list, :with_places]

    after(:build) do |hp|
      hp.generic_lists = FactoryGirl.create_list(:generic_list, 3, :with_places)
      hp.contributor_lists = FactoryGirl.create_list(:contributor_list, 3, :with_places)
    end
  end
end
