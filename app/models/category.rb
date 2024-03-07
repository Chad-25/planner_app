class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: { message: "Please enter a title." }, uniqueness: { scope: :user_id }
end
