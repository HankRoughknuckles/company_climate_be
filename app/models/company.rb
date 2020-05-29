# typed: strict
class Company < ApplicationRecord
  has_many :tasks
  has_many :company_years
  has_many :years, through: :company_years

  validates :name, uniqueness: true, presence: true

  sig { params(year: Integer).returns(Integer) }
  def co2_produced_in(year)
    self.company_years.where(year_id: year).first.co2_produced
  end
end
