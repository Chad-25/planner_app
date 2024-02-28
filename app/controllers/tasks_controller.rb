class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = current_user.categories.find(params[:category_id])
    @tasks = @category.tasks
  end

  def show
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find_by(id: params[:id])

    if @task.nil?
      redirect_to category_path(@category), alert: "Task not found."
    end
  end

  def new
    @category = current_user.categories.find(params[:category_id])
    @task = Task.new
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_path(@category), notice: "Task was successfully created."
    else
      render :new
    end
  end

  def edit
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_path(@category), notice: "Task status updated successfully."
    else
      render :edit
    end
  end

  def update_status
    @task = Task.find(params[:id])
    if @task.update(task_params) && @task.status_complete
      flash[:notice] = "Wooh, good job!"
    end
    redirect_to request.referrer
  end

  def destroy
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path, notice: "Task was successfully deleted.")
  end

  def today
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :status_complete)
  end

end
