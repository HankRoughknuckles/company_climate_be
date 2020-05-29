# typed: true
class CreateYears < ActiveRecord::Migration[6.0]
  def change
    create_table :years do |t|
      t.integer :name, null: false, unique: true

      t.timestamps
    end
    add_index :years, :name
  end
end
