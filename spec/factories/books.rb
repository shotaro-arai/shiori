FactoryBot.define do
  factory :book do
    text          { Faker::Lorem.sentence[1..140] }
    quote         { Faker::Lorem.sentence[1..140] }
    title         { Faker::Book.title }
    title_option  { Faker::Lorem.sentence }
    author        { Faker::Book.author }
    publish       { Faker::Book.publisher }
    year          { Faker::Number.between(from: 1, to: 2021) }
    page          { Faker::Number.number }
    association :user

    after(:build) do |book|
      book.image.attach(io: File.open('public/images/IMG_20210416_181642.jpg'), filename: 'IMG_20210416_181642.jpg')
    end
  end
end
