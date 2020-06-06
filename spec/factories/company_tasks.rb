# typed: false
# == Schema Information
#
# Table name: company_tasks
#
#  id           :bigint           not null, primary key
#  percent_done :integer          default(0)
#  company_id   :bigint           not null
#  task_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :company_task do
    percent_done { 1 }
    company { nil }
    task { nil }

    factory :null_company_task do
      percent_done { 0 }
      company { nil }
      task { nil }
    end
  end
end
