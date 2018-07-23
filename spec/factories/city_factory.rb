FactoryBot.define do
  factory :city do
    name Faker::Address.city
  end

  factory :cities, class: City do
    sequence(:name) { Faker::Address.city }
  end
end
