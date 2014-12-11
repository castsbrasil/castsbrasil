class HomeController < ApplicationController
  def index
    @casts = CastRepository.new.get_home_collections
  end

  def contributing; end

  def about; end

  def screencasts
    @casts = CastRepository.new.get_screencasts_collections
  end

  def screencast
    @cast = Cast.find_by_param(params[:id])
  end
end
