FactoryBot.define do
  factory :search_params, class: Hash do
    city_id         Faker::Number.between(1, 10)
    organization_id Faker::Number.between(1, 10)
    title           Faker::Company.name
    tag_list        Faker::Lorem.words(4)

    initialize_with { attributes }
  end
end
