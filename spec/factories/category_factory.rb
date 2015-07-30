FactoryGirl.define do
  factory :category do
    name "Test category"
    sequence(:priority) { |i| i }
    association :place, factory: :place

    after(:build) do |category|
      category.menu = FactoryGirl.create(:menu, place: category.place)
    end

    factory :category_with_dishes do
      after(:create) do |category, _|
        create(:dish, :with_default_image, category: category)
      end
    end
  end
end
