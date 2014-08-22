class CategoriesController < ApplicationController
	before_action :authenticate_user!, except: %i(index show)
	before_action :set_category, only: %i(show edit update)

  def index
    @categories = Category.all
  end

  def show
  end

  def new
  	@category = Category.new
  end

  def edit
  end
 
  def create
  	@category = Category.create(category_params)
  	respond_with @category
  end

  def update
    @category.update(category_params)
    respond_with @category
  end

  private 

  def category_params
  	params.require(:category).permit(:name)
  end

  def set_category
  	@category = Category.find(params[:id])
  end
end
