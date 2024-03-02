class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @tasks_by_category = current_user.tasks.where(due_date: Date.today, status_complete: false)
      .includes(:category)
      .group_by(&:category)

    @start_date = Date.today.beginning_of_month
    @end_date = @start_date.end_of_month
    @tasks = Task.where(due_date: @start_date..@end_date)
  end
end
