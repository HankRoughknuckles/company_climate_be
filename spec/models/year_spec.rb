require 'rails_helper'

RSpec.describe Year, type: :model do
  it 'should set the id to be the same as the year name' do
    year = create(:year, name: 2020)

    expect(year.id).to eq 2020
  end
end
