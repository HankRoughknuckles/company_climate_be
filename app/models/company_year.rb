# typed: strict
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

# Used for keeping track of how much co2 a company produced and captured year by
# year
class CompanyYear < ApplicationRecord
  belongs_to :company
  belongs_to :year
end
