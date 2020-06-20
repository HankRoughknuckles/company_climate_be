# typed: false
require 'rails_helper'

RSpec.describe "V1::Companies", type: :request do
  describe 'GET /companies (index)' do
    it 'should give the companies' do
      create_list(:company, 5)

      get '/v1/companies'

      expect(json.length).to eq(5)
    end

    it 'should not have the tasks for the companies' do
      create(:company_with_task)
      get '/v1/companies'

      expect(json.dig(0, 'tasks')).to be_nil
    end

    it 'should have the correct attributes on each element' do
      attributes = {
        name: 'fooblast co',
        total_co2_produced: 10,
        total_co2_captured: 5,
      }
      company = create(:company, attributes)

      get '/v1/companies'

      company_in_response = json[0]
      expect(company_in_response['name']).to eq company.name
      expect(company_in_response['total_co2_produced']).to eq company.total_co2_produced
      expect(company_in_response['total_co2_captured']).to eq company.total_co2_captured
      expect(company_in_response['score']).to eq company.score
    end
  end

  describe 'GET /company (show)' do
    it 'should have the correct attributes' do
      attributes = {
        name: 'fooblast co',
        total_co2_produced: 10,
        total_co2_captured: 5,
      }
      company = create(:company, attributes)

      get "/v1/companies/#{company.id}"

      expect(json['name']).to eq company.name
      expect(json['total_co2_produced']).to eq company.total_co2_produced
      expect(json['total_co2_captured']).to eq company.total_co2_captured
      expect(json['score']).to eq company.score
    end

    describe 'tasks on the company' do
      it 'should include the task\'s name' do
        company = create(:company_with_task)

        get "/v1/companies/#{company.id}"

        expect(json.dig('tasks', 0, 'name')).to eq(company.tasks.first.name)
      end

      it 'should include how much percent of the task is completed' do
        percent_done = 45
        company = create(:company_with_task)
        company.company_tasks.first.update(percent_done: percent_done)

        get "/v1/companies/#{company.id}"

        expect(json.dig('tasks', 0, 'percent_done')).to eq(percent_done)
      end

      describe "universal tasks" do
        let!(:universal_task) { create(:task, :universal, {name: 'universal_1'}) }
        let(:company) { create(:company) }

        it 'should have a section for universal tasks' do
          company_task = create(:company_task, company: company, task: universal_task, percent_done: 55)
          company.company_tasks << company_task
          get "/v1/companies/#{company.id}"

          expect(json.dig('universal_tasks', 0, 'name')).to eq (universal_task.name)
          expect(json.dig('universal_tasks', 0, 'description')).to eq (universal_task.description)
          expect(json.dig('universal_tasks', 0, 'percent_done')).to eq (55)
        end

        it 'should have the percent_done as 0 if there is no company_task for the company' do
          company.company_tasks.delete_all

          get "/v1/companies/#{company.id}"

          expect(json.dig('universal_tasks', 0, 'percent_done')).to eq (0)
        end
      end
    end
  end
end
