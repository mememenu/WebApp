FactoryGirl.define do
  factory :spotlight do
    trait :with_items do
      after :build do |sp|
        3.times do
          ['list', 'place'].each do |item_type|
            sp.spotlight_items << FactoryGirl.create(:"#{item_type}_item", :with_image)
          end
        end
      end
    end
  end
end
