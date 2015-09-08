FactoryGirl.define do
  factory :user do
    first_name "Dummy"
    last_name "User"

    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'password'

    factory :admin, parent: :user do
      admin true
    end
  end
end
