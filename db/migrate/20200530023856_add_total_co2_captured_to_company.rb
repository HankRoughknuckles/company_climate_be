# typed: true
class AddTotalCo2CapturedToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :total_co2_captured, :integer, default: 0
  end
end
