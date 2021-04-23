class AddLengthLimitToNameFromTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :name, :string, :limit=>25
  end

  def down
    change_column :tasks, :name, :string
  end
end
