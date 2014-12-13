class HomeController < ApplicationController
  def index
    @casts = CastCollection.filtered
  end

  def contributing; end

  def about; end

  def screencasts
    @casts = CastCollection.all
  end

  def screencast
    @cast = Cast.find_by_param(params[:id])
  end
end
