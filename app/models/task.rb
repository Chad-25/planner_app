class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: { message: "Please enter a task." }
  validate :due_date_not_in_past

  def due_date_not_in_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Date can't be in the past.")
    end
  end
end
