# typed: false
class Year < ApplicationRecord
  def set_id_as_year_name
    self.id = self.name
  end

  before_create(:set_id_as_year_name)
end
