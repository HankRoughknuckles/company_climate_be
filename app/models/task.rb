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
# typed: strict
class Task < ApplicationRecord
  has_many :company_tasks
  has_many :companies, through: :company_tasks

  # tasks where are supposed to be shared across all companies, regardless of
  # whether they explicitly have relationships set up or not
  scope :universal, -> { where(universal: true) }

  # returns the company_task join table element between the task and the company
  # associated with the passed company.id
  sig { params(company_id: Integer).returns(CompanyTask) }
  def get_company_task_for(company_id)
    self.company_tasks.find_by(company_id: company_id) || FactoryBot.build(:null_company_task)
  end
end
