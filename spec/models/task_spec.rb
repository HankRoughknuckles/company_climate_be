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
require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:company) { create(:company_with_task) }
  let(:task) { company.tasks.first }

  it 'should be able to exist without a company' do
    task = create(:task)
    expect(task).to be_valid
  end

  it 'should respond to universal?' do
    expect(task).to respond_to(:universal?)
  end

  describe 'universal scope' do
    it 'should include all universal tasks' do
      universal_1 = create(:task, universal: true)
      universal_2 = create(:task, universal: true)

      expect(Task.universal).to eq [universal_1, universal_2]
    end

    it 'should not include non-universal tasks' do
      create(:task, universal: false)

      expect(Task.universal).to eq []
    end
  end
end
