class AddTotalCo2ProducedToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :total_co2_produced, :integer, default: 0
  end
end
