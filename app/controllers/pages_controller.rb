class PagesController < ApplicationController

  def search 
      @parameter = params[:search].downcase  
      @results = Song.search_results
  end
end
