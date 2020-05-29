# typed: false
require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should require a name' do
    expect(create(:company)).to validate_presence_of(:name)
  end

  it 'should not allow duplicate names' do
    expect(create(:company)).to validate_uniqueness_of(:name)
  end

  describe 'tasks' do
    it 'should have many tasks' do
      company = create(:company, tasks: create_list(:task, 3))

      expect(company.tasks.length).to eq(3)
    end
  end
end
