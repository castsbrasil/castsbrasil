class CastsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @casts = Cast.all
  end

  def show
    @cast = Cast.find_by_param(params[:id])
  end

  def new
    @cast = Cast.new
  end

  def create
    @cast = current_user.casts.create!(valid_params(params))
    redirect_to cast_path(@cast)
  end

  def edit
    @cast = current_user.casts.find_by_param(params[:id])
  end

  def update
    @cast = current_user.casts.find_by_param(params[:id])
    @cast.update!(valid_params(params))
    redirect_to cast_path(@cast)
  end

  protected

  def valid_params(params)
    params.require(:cast).permit(:name, :description, :url)
  end
end
