class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = @user.categories
  end

  def new
    @user = current_user
    @category = @user.categories.build
  end

  def create
    @user = current_user
    @category = @user.categories.build(category_params)
    if @category.save
      redirect_to category_path(@category), notice: "Category created successfully"
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @category = @user.categories.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @category = @user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to user_category_path(@user, @category), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @category = @user.categories.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to @category, notice: "Category was successfully deleted."
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :target_date, :target_time)
  end
end
