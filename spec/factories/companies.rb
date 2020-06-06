# typed: false
# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  total_co2_produced :float            default(0.0)
#  total_co2_captured :float            default(0.0)
#
FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }
    total_co2_produced { rand(10000) }
    total_co2_captured { rand(10000) }

    factory :company_with_task do
      after(:create) do |company|
        task = create(:task)
        create(:company_task, company: company, task: task)
      end
    end
  end
end
