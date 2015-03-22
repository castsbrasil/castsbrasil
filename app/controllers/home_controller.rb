class HomeController < ApplicationController
  def index
    @casts = CastCollection.filtered_and_limited
  end
end
