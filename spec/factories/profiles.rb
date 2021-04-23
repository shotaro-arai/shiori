FactoryBot.define do
  factory :profile do
    text                  {Faker::Lorem.sentence}
    age                   {"20代"}
    sex                   {"男"}
    job                   {Faker::Job.title}
  end
end
