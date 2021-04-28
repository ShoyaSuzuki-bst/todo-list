class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :status, foreign_key: true
  end
end
