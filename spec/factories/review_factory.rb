FactoryBot.define do
  factory :review do
    text Faker::Lorem.paragraph
    course
    association :author, factory: :user
  end

  factory :reviews, class: Review do
    sequence(:text) { Faker::Lorem.paragraph }
    course
    association :author, factory: :user
  end
end
