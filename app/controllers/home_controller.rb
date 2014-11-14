class HomeController < ApplicationController
  def index
    @most_recent = Cast.most_recent
    @most_viewed = Cast.none
  end

  def contributing; end

  def about; end

  def screencasts; end
end
