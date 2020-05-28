require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe 'GET /companies' do
    it 'should give the companies' do
      create_list(:company, 5)

      get '/companies'

      expect(json.length).to eq(5)
    end
  end
end
