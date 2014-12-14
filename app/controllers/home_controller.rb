class HomeController < ApplicationController
  def index
    @casts = CastCollection.filtered
  end
end
