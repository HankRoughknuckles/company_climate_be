# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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

  it 'company_years should associate properly' do
    company = create(:company)
    year = create(:year, name: 2020)
    company.years << year

    expect(company.years).to eq([year])
  end

  describe '#co2_produced_in' do
    it 'should tell you how much co2 the company produced in the given year' do
      year = create(:year, name: 2020)
      company = create(:company)
      co2_produced = 1000
      create(:company_year, company: company, year: year, co2_produced: co2_produced)

      expect(company.co2_produced_in(year.name)).to eq (co2_produced)
    end
  end
end
