# typed: false
FactoryBot.define do
  factory :company do
    name { Faker::Lorem.word }

    factory :company_with_task do
      after(:create) do |company|
        company.tasks << create(:task)
      end
    end
  end
end
