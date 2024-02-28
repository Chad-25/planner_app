class RemoveColumnsFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :due_time, :time
  end
end
