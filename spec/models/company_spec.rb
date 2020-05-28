# typed: false
require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'should require a name' do
    expect(build(:company, name: nil)).not_to be_valid
  end

  it 'should not allow duplicate names' do
    create(:company, name: 'foo')

    expect(build(:company, name: 'foo')).not_to be_valid
  end
end
