FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "#{Faker::Name.first_name}#{n}" }
    sequence(:last_name) { |n| "#{Faker::Name.last_name}#{n}" }
    sequence(:email) { |n| "pivorak.member#{n}@example.com" }
    password Faker::Internet.password(20)
    role 'user'
  end
end
