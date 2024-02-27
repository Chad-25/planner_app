class UpdateStatusCompleteDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :status_complete, from: nil, to: false
  end
end
