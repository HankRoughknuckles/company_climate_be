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

  describe '#co2_captured_in' do
    it 'should tell you how much co2 the company captured in the given year' do
      year = create(:year, name: 2020)
      company = create(:company)
      co2_captured = 1000
      create(:company_year, company: company, year: year, co2_captured: co2_captured)

      expect(company.co2_captured_in(year.name)).to eq (co2_captured)
    end
  end

  describe '#score' do
    describe 'when there is data available for this year' do
      let(:year) { create(:year, name: 2020) }
      let(:company) { create(:company) }
      let(:co2_produced) { 1000 }
      let(:co2_captured) { 500 }
      before do
        create(:company_year,
               company: company,
               year: year,
               co2_produced: co2_produced,
               co2_captured: co2_captured)
      end

      it 'should equal this year\'s captured minus production' do
        expect(company.score).to eq (co2_captured - co2_produced)
      end
    end

    describe 'when there is only data for the company\'s full lifetime available' do
      let(:total_co2_produced) { 200 }
      let(:total_co2_captured) { 100 }
      let(:company) { create(:company, total_co2_produced: total_co2_produced, total_co2_captured: total_co2_captured) }

      it 'should equal this year\'s captured minus production' do
        expect(company.score).to eq (total_co2_captured - total_co2_produced)
      end
    end

    describe 'when there is no production or capture data available' do
      let(:company) { create(:company, total_co2_produced: nil, total_co2_captured: nil) }

      it 'should return nil' do
        expect(company.score).to eq (nil)
      end
    end
  end

  describe 'when destroyed' do
    it 'it should destroy any associated company_tasks' do
      company = create(:company)
      task = create(:task)
      company_task = create(:company_task, company: company, task: task)

      company.destroy
      expect(CompanyTask.where(id: company_task.id).length).to eq 0
    end
  end
end
