FactoryBot.define do
  factory :course do
    title        Faker::StarWars.planet
    description  Faker::Lorem.paragraph
    url          Faker::Internet.url
    slug         Faker::Internet.slug
    tag_list     Faker::Lorem.words(4)
    city
    organization
    owner
  end

  factory :courses, class: Course do
    sequence(:title)        { Faker::StarWars.planet }
    sequence(:description)  { Faker::Lorem.paragraph }
    sequence(:url)          { Faker::Internet.url }
    sequence(:slug)         { Faker::Internet.slug }
    sequence(:tag_list)     { Faker::Lorem.words(1) }
    city
    organization
    owner
  end
end
