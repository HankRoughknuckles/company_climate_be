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
  after_destroy :destroy_non_universal_tasks

  belongs_to :company
  belongs_to :task

  sig { returns(T.nilable(Task)) }
  def destroy_non_universal_tasks
    self.task.destroy unless task.universal?
  end
end
