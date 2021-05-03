FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email} 
    password              {Faker::Lorem.characters(number: 6)}
    password_confirmation {password}
  end
  
  after(:build) do |book|
    book.image.attach(io: File.open('public/images/IMG_20210427_112254.jpg'), filename: 'IMG_20210427_112254.jpg')
  end
end
