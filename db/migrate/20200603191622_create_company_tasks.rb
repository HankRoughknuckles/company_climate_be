# typed: true
class CreateCompanyTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :company_tasks do |t|
      t.integer :percent_done, default: 0
      t.references :company, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end

    remove_reference :tasks, :company
    remove_column :tasks, :percent_done, :integer
  end
end
