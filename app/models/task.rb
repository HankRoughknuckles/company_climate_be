# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  percent_done :integer
#  company_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# typed: strict
class Task < ApplicationRecord
  belongs_to :company, optional: true

  # tasks where are supposed to be shared across all companies, regardless of
  # whether they explicitly have relationships set up o rnot
  scope :universal, -> { where(universal: true) }
end
