# typed: false
# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  universal   :boolean
#
FactoryBot.define do
  factory :task do
    sequence(:name) {|n| "Task #{n}" }
    description { "MyText" }

    trait :universal do
      universal { true }
    end
  end
end
