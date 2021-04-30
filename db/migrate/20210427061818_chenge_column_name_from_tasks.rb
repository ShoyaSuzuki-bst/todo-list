class ChengeColumnNameFromTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :limit, :limited_at
  end
end
