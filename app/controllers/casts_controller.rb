class CastsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)

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
    @cast = current_user.casts.new(valid_params(params))
    respond_to do |format|
      if @cast.save
        format.html { redirect_to @cast, notice: 'Cast was successfully created.' }
        format.json { render :show, status: :created, location: @cast }
      else
        format.html { render :new }
        format.json { render json: @cast.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cast = current_user.casts.find_by_param(params[:id])
  end

  def update
    @cast = current_user.casts.find_by_param(params[:id])
    respond_to do |format|
      if @cast.update!(valid_params(params))
        format.html { redirect_to @cast, notice: t('.messages.success') }
        format.json { render :show, status: :updated, location: @cast }
      else
        format.html { render :new }
        format.json { render json: @cast.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def valid_params(params)
    params.require(:cast).permit(:name, :description, :url)
  end
end
