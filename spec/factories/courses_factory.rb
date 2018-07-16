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
    # after(:create) do |course|
    #   course.logo.attach(
    #     io: File.open(Rails.root.join('app/assets/images/pivorak logo/pivorak_logo.png')),
    #     filename: 'pivorak_logo.png', content_type: 'image/png'
    #   )
    # end
  end
end
