class CastsController < ApplicationController
  def index
    @casts = Cast.all
  end

  def show
    @cast = Cast.find(params[:id])
  end
end
