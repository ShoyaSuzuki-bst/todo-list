class AddIndexTonameOfTasks < ActiveRecord::Migration[5.2]
  def up
    add_index :tasks, :name
  end
  def down
    remove_index :tasks, :name
  end
end
