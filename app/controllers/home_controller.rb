class HomeController < ApplicationController
  def index
    @casts = CastCollection.filtered
  end

  def profile
    @casts = CastRepository.new.get_home_collections
  end
end
