FactoryBot.define do
  factory :organization do
    name        Faker::Company.name
    site        Faker::Internet.url
    description Faker::Lorem.paragraph
  end
end
