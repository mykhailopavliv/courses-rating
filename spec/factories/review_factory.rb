FactoryBot.define do
  factory :review do
    text Faker::Lorem.paragraph
    course
    association :author, factory: :user
  end
end
