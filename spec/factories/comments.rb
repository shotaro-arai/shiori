FactoryBot.define do
  factory :comment do
    text          {Faker::Lorem.sentence[1..140]}
    association :user
    association :book
  end
end
