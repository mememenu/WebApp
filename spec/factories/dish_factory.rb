FactoryGirl.define do
  factory :dish do
    association :restaurant, factory: :restaurant

    after(:build) do |dish|
      dish.menu = FactoryGirl.create(:menu, restaurant: dish.restaurant)
    end

    after(:build) do |dish|
      dish.category = FactoryGirl.create(:category, restaurant: dish.restaurant,
                                         menu: dish.menu)
    end
  end
end
