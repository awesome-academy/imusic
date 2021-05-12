class HistoriesController < ApplicationController
  before_action :logged_in_user

  def index
    @histories = current_user.histories.paginate(page: params[:page])
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end 

end
