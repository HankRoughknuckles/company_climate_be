# typed: true
class CreateCompanyYears < ActiveRecord::Migration[6.0]
  def change
    create_table :company_years do |t|
      t.references :company, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true
      t.float :co2_produced
      t.float :co2_captured

      t.timestamps
    end
  end
end
