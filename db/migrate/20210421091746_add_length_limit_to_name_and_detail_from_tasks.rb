class AddLengthLimitToNameAndDetailFromTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :name, :string, :limit=>25
    change_column :tasks, :detail, :text, :limit=>660
  end

  def down
    change_column :tasks, :name, :string
    change_column :tasks, :detail, :text
  end
end
