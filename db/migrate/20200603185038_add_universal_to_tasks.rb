# typed: false
class AddUniversalToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :universal, :boolean, index: true
  end
end
