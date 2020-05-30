# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  total_co2_produced :integer          default(0)
#  total_co2_captured :integer          default(0)
#
FactoryBot.define do
  factory :company do
    name { Faker::Lorem.word }
    total_co2_produced { rand(10000) }
    total_co2_captured { rand(10000) }

    factory :company_with_task do
      after(:create) do |company|
        company.tasks << create(:task)
      end
    end
  end
end
