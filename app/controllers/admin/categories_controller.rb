class Admin::CategoriesController < ApplicationController
  before_action :require_admin
  before_action :find_category, only: %i[edit update destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render "edit"
    end
  end

  def destroy
    @user = User.all
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_path
  end
	
  private

  def find_category
    @category = Category.find_by(id: params[:id])
    unless @category
      redirect_to root_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
