class RenameNameToTitleInCategories < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :name, :title
  end
end
