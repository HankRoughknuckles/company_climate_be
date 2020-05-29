# typed: strict
class CompanyYear < ApplicationRecord
  belongs_to :company
  belongs_to :year
end
