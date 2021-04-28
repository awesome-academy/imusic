class CategoriesController < ApplicationController
  before_action :find_category, only: %i[show]

  def show
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
