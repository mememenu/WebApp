FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'password'

    factory :admin, parent: :user do
      admin true

    end
  end
end
