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
      create(:company)
      get '/companies'

      expect(json[0]['tasks']).to be_nil
    end
  end

  describe 'GET /company' do
    it 'should have the correct properties' do
      company = create(:company)

      get "/companies/#{company.id}"

      expect(json['name']).to eq (company.name)
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
