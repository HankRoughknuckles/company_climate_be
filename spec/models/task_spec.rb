# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  percent_done :integer
#  company_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# typed: false
require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:company) { create(:company) }
  let(:task) { create(:task, company: company) }

  it 'should be able to belong to a company' do
    expect(task.company).to eq company
  end

  it 'should be able to exist without a company' do
    task = create(:task, company: nil)
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
