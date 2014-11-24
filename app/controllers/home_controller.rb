class HomeController < ApplicationController
  def index
    @casts = CastRepository.new.get_home_collections
  end

  def contributing; end

  def about; end

  def screencasts; end
end
