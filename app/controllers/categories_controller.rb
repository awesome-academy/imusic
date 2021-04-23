class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show edit update destroy]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def show
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
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to countries_url
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
end
