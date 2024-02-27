class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.time :due_time
      t.boolean :status_complete
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
