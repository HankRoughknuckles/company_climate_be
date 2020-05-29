FactoryBot.define do
  factory :company_year do
    company { nil }
    year { nil }
    co2_produced { 0 }
    co2_captured { 0 }
  end
end
