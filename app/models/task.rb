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
end
