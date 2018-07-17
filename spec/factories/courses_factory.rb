FactoryBot.define do
  factory :course do
    title       Faker::StarWars.planet
    description Faker::Lorem.paragraph
    url         Faker::Internet.url
    rating      Faker::Number.between(1, 10)
    slug        Faker::Internet.slug
    tag_list    Faker::Lorem.words(4)
    city
    organization
  end
end
