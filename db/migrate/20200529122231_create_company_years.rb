# typed: true
class CreateCompanyYears < ActiveRecord::Migration[6.0]
  def change
    create_table :company_years do |t|
      t.references :company, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true
      t.integer :co2_produced, default: 0
      t.integer :co2_captured, default: 0

      t.timestamps
    end
  end
end
