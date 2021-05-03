FactoryBot.define do
  factory :profile do
    text                  { Faker::Lorem.sentence }
    age                   { '20代' }
    sex                   { '男' }
    job                   { Faker::Job.title }
    association :user

    after(:build) do |profile|
      profile.image.attach(io: File.open('public/images/IMG_20210427_112254.jpg'), filename: 'IMG_20210427_112254.jpg')
    end
  end
end
