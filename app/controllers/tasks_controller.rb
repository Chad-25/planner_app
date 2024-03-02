class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: [:update_status]
  before_action :set_task_update, only: [:update_status]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @category.tasks
  end

  def show
    redirect_to category_path(@category), alert: "Task not found." if @task.nil?
  end

  def new
    @task = Task.new
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category), notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_path(@category), notice: "Task status updated successfully."
    else
      render :edit
    end
  end

  def update_status
    if @task.update(task_params) && @task.status_complete
      flash[:notice] = "Wooh, good job!"
    end
    redirect_to request.referrer
  end

  def destroy
    @task.destroy
    redirect_back(fallback_location: root_path, notice: "Task was successfully deleted.")
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def set_task_update
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :status_complete)
  end
end
