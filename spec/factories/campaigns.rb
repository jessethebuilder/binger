FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.sentence }
    status { Campaign::STATUSES.sample }

    trait :pending do
      status { 'pending' }
    end
  end
end
