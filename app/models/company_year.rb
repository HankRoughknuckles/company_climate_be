# == Schema Information
#
# Table name: company_years
#
#  id           :bigint           not null, primary key
#  company_id   :bigint           not null
#  year_id      :bigint           not null
#  co2_produced :integer          default(0)
#  co2_captured :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# typed: strict
class CompanyYear < ApplicationRecord
  belongs_to :company
  belongs_to :year
end
