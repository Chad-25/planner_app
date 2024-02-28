class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @tasks_by_category = Task.where(due_date: Date.today, status_complete: false)
    .includes(:category)
    .group_by(&:category)
  end
end
