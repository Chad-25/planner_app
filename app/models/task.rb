class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: { message: "Please enter a task." }
end
