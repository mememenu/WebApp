FactoryGirl.define do
  factory :list do
    trait :with_places do
      after(:build) do |list|
        list.places = FactoryGirl.create_list(:place, 4, :with_avatar)
      end
    end

    factory :home_page_list do
      sequence(:name) { |i| "Home Page List #{i}" }
      kind "HomePageList"
    end

    factory :featured_list do
      sequence(:name) { |i| "Featured List #{i}" }
      kind "FeaturedList"
    end

    factory :user_list do
      sequence(:name) { |i| "User List #{i}" }
      kind "UserList"

      after(:build) do |list|
        list.user ||= FactoryGirl.create(:user)
      end
    end
  end
end
