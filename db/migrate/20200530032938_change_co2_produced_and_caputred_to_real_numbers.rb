# typed: true
class ChangeCo2ProducedAndCaputredToRealNumbers < ActiveRecord::Migration[6.0]
  def change
    # the totals produced and captured on companies
    change_column :companies, :total_co2_produced, :real
    change_column :companies, :total_co2_captured, :real

    # the amounts for each year for a company
    change_column :company_years, :co2_produced, :real
    change_column :company_years, :co2_captured, :real
  end
end
