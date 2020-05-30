# == Schema Information
#
# Table name: company_years
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  year_id      :bigint           not null
#  co2_produced :float            default(0.0)
#  co2_captured :float            default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe CompanyYear, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
