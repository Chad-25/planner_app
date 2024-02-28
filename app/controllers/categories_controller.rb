class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = @user.categories
  end

  def new
    @category = @user.categories.build
  end

  def create
    @category = @user.categories.build(category_params)
    if @category.save
      redirect_to category_path(@category), notice: "Category created successfully"
    else
      flash[:alert] = @category.errors.full_messages_for(:title).first
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to user_category_path(@user, @category), notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  private

  def set_user
    @user = current_user
  end

  def set_category
    @category = @user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
