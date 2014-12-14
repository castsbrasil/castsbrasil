class CategoriesController < AuthorizedController
  skip_before_action :authenticate_user!, only: %i(index show)

  def create
    @category = Category.create(category_params)
    respond_with @category
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    respond_with @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
