FactoryBot.define do
  factory :company_task do
    percent_done { 1 }
    company { nil }
    task { nil }
  end
end
