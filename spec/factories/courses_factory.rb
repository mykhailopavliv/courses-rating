FactoryBot.define do
  factory :course do
    title       Faker::StarWars.planet
    description Faker::Lorem.paragraph
    url         Faker::Internet.url
    slug        Faker::Internet.slug
    tag_list    Faker::Lorem.words(4)
    city
    organization
    user
  end
end
