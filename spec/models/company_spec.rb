require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should have a title' do
    expect(Company.new).to respond_to(:name)
  end
end
