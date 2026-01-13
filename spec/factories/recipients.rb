FactoryBot.define do
  factory :recipient do
    name { Faker::Name.name }
    campaign
    email { Faker::Internet.email }

    trait :with_phone do
      phone { Faker::PhoneNumber.phone_nunmber }
    end
  end
end
