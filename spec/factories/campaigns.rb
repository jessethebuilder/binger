FactoryBot.define do
  factory :campaign do
    sequence(:title) { |n| "Campaign #{n}" }
    status { Campaign::STATUSES.sample }
  end
end
