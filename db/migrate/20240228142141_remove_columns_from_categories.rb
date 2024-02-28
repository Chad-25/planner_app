class RemoveColumnsFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :target_date, :date
    remove_column :categories, :target_time, :time
  end
end
