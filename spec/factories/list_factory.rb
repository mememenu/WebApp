FactoryGirl.define do
  factory :list do
    trait :with_places do
      after(:build) do |list|
        list.places = FactoryGirl.create_list(:place, 4, :with_avatar)
      end
    end

    factory :generic_list do
      sequence(:name) { |i| "Generic List #{i}" }
      kind "GenericList"
    end

    factory :contributor_list do
      sequence(:name) { |i| "Contributor List #{i}" }
      kind "ContributorList"
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
