# typed: strict
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
class CompanyTask < ApplicationRecord
  belongs_to :company
  belongs_to :task
end
