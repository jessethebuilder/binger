FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.sentence }
    status { Campaign::STATUSES.sample }
  end
end
