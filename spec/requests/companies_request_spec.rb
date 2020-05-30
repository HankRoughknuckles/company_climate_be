# typed: false
require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe 'GET /companies' do
    it 'should give the companies' do
      create_list(:company, 5)

      get '/companies'

      expect(json.length).to eq(5)
    end

    it 'should not have the tasks for the companies' do
      create(:company_with_task)
      get '/companies'

      expect(json[0]['tasks']).to be_nil
    end

    it 'should have the correct attributes on each element' do
      attributes = {
        name: 'fooblast co',
        total_co2_produced: 10,
        total_co2_captured: 5,
      }
      create(:company, attributes)

      get '/companies'

      company_in_response = json[0]
      expect(company_in_response['name']).to eq attributes[:name]
      expect(company_in_response['total_co2_produced']).to eq attributes[:total_co2_produced]
      expect(company_in_response['total_co2_captured']).to eq attributes[:total_co2_captured]
    end
  end

  describe 'GET /company' do
    it 'should have the correct attributes' do
      attributes = {
        name: 'fooblast co',
        total_co2_produced: 10,
        total_co2_captured: 5,
      }
      company = create(:company, attributes)

      get "/companies/#{company.id}"

      expect(json['name']).to eq attributes[:name]
      expect(json['total_co2_produced']).to eq attributes[:total_co2_produced]
      expect(json['total_co2_captured']).to eq attributes[:total_co2_captured]
    end

    describe 'tasks on the company' do
      it 'should include the task\'s name' do
        company = create(:company_with_task)

        get "/companies/#{company.id}"

        expect(json.dig('tasks', 0, 'name')).to eq(company.tasks.first.name)
      end

      it 'should include how much percent of the task is completed' do
        percent_done = 45
        company = create(:company)
        task = create(:task, percent_done: percent_done)
        company.tasks << task

        get "/companies/#{company.id}"

        expect(json.dig('tasks', 0, 'percent_done')).to eq(percent_done)
      end
    end
  end
end
