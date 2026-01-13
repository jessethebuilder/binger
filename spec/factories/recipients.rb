FactoryBot.define do
  factory :recipient do
    name { Faker::Name.name }
    campaign

    after(:build) do |recipient|
      # Since a Recipient must have a :phone OR an email, flip a coin to see
      # which gets a value here.
      if Random.rand(1..2) == 1
        recipient.email = Faker::Internet.email
      else
        recipient.phone = Faker::PhoneNumber.phone_number
      end
    end

    trait :with_email do
      email { Faker::Internet.email }
    end

    trait :with_phone do
      phone { Faker::PhoneNumber.phone_nunmber }
    end
  end
end
