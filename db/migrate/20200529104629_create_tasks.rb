# typed: true
class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :percent_done
      t.references :company, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :name
  end
end
