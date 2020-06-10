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
require 'rails_helper'

RSpec.describe CompanyTask, type: :model do
  describe 'when destroyed' do
    it 'should destroy any related non-universal tasks' do
      company = create(:company)
      task = create(:task, universal: false)
      company_task = create(:company_task, company: company, task: task)

      expect { company_task.destroy }
        .to change { Task.where(id: task.id).length }
        .from(1).to(0)
    end

    it 'should not destroy related universal tasks' do
      company = create(:company)
      universal_task = create(:task, universal: true)
      company_task = create(:company_task, company: company, task: universal_task)

      expect { company_task.destroy }
        .not_to change { Task.where(id: universal_task.id).length }
    end
  end
end
