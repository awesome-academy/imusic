class CountriesController < ApplicationController
  before_action :find_country, only: %i[show]
  
  def show
  end

  private

  def find_country
    @country = Country.find_by(id: params[:id])
    unless @country
      redirect_to root_path
    end
  end

  def country_params
    params.require(:country).permit(:name)
  end 
end
