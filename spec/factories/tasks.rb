# typed: false
FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    percent_done { 1 }
    company { nil }
  end
end
