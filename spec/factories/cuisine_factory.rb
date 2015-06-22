FactoryGirl.define do
  factory :cuisine do
    genre 'French'

    factory :cuisine_with_restaurants do
      after(:create) do |cuisine, evaluator|
        create_list(:restaurant_cuisine, 2, cuisine: cuisine)
      end
    end
  end
end
