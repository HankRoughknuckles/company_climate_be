# typed: false
# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  total_co2_produced :float            default(0.0)
#  total_co2_captured :float            default(0.0)
#
require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should require a name' do
    expect(create(:company)).to validate_presence_of(:name)
  end

  it 'should not allow duplicate names' do
    expect(create(:company)).to validate_uniqueness_of(:name)
  end

  describe 'default column values' do
    it 'should default the total co2 produced to 0' do
      expect(Company.create(name: 'foo').total_co2_produced).to eq 0
    end

    it 'should default the total co2 captured to 0' do
      expect(Company.create(name: 'foo').total_co2_captured).to eq 0
    end
  end

  describe 'tasks' do
    it 'should have many tasks' do
      company = create(:company)
      task = create(:task)
      create(:company_task, task: task, company: company)

      expect(company.tasks).to eq([task])
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
