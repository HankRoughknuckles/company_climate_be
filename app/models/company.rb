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

  sig { params(year: Integer).returns(T.nilable(Float)) }
  def co2_produced_in(year)
    self.company_years.where(year_id: year).first&.co2_produced
  end

  sig { returns(T.nilable(Float)) }
  def co2_produced_this_year
    self.co2_produced_in(Date.today.year)
  end

  sig { params(year: Integer).returns(T.nilable(Float)) }
  def co2_captured_in(year)
    self.company_years.where(year_id: year).first&.co2_captured
  end

  sig { returns(T.nilable(Float)) }
  def co2_captured_this_year
    self.co2_captured_in(Date.today.year)
  end

  sig { returns(T.nilable(Float)) }
  def score
    produced_this_year = self.co2_produced_this_year

    if produced_this_year
      return (self.co2_captured_this_year || 0.0) - produced_this_year
    elsif self.total_co2_produced
      return (self.total_co2_captured || 0.0) - self.total_co2_produced
    else
      return nil
    end
  end
end
