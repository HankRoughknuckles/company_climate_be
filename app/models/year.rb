# == Schema Information
#
# Table name: years
#
#  id         :bigint           not null, primary key
#  name       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# typed: true
class Year < ApplicationRecord
  def set_id_as_year_name
    self.id = self.name
  end

  before_create(:set_id_as_year_name)
end
