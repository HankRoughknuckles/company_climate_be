# == Schema Information
#
# Table name: company_years
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  year_id      :bigint           not null
#  co2_produced :integer          default(0)
#  co2_captured :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# typed: false
FactoryBot.define do
  factory :company_year do
    company { nil }
    year { nil }
    co2_produced { 0 }
    co2_captured { 0 }
  end
end
