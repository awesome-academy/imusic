class Admin::CountriesController < ApplicationController
  before_action :find_country, only: %i[edit update destroy]
  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_countries_path
    else
      render :new
    end
  end

  def index
    @countries = Country.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to @country
    else
      render "edit"
    end
  end

  def destroy
    @country.destroy
    flash[:success] = "Coutry deleted"
    redirect_to admin_countries_path
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

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
