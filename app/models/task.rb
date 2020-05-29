# typed: strict
class Task < ApplicationRecord
  belongs_to :company, optional: true
end
