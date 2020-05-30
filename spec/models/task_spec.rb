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
  it 'should be able to belong to a company' do
    company = create(:company)
    task = create(:task, company: company)
    expect(task.company).to eq company
  end

  it 'should be able to exist without a company' do
    task = create(:task, company: nil)
    expect(task).to be_valid
  end
end
