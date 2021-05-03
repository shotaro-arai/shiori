FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.characters(number: 6) }
    password_confirmation { password }
  end
end
