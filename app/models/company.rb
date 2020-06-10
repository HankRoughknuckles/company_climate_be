# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  total_co2_produced :float            default(0.0)
#  total_co2_captured :float            default(0.0)
#
# typed: strict
class Company < ApplicationRecord
  has_many :company_tasks, dependent: :destroy
  has_many :tasks, through: :company_tasks
  has_many :company_years
  has_many :years, through: :company_years

  validates :name, uniqueness: true, presence: true

  sig { params(year: Integer).returns(Float) }
  def co2_produced_in(year)
    self.company_years.where(year_id: year).first.co2_produced
  end
end
