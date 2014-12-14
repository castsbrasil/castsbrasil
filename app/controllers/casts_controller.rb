class CastsController < AuthorizedController
  skip_before_action :authenticate_user!, only: %i(index show)

  def create
    @cast = current_user.casts.new(cast_params)
    @cast.save
    respond_with @cast
  end

  def edit
    @cast = current_user.casts.find_by_param(params[:id])
  end

  def update
    @cast = current_user.casts.find_by_param(params[:id])
    @cast.update(cast_params)
    respond_with @cast
  end

  protected

  def cast_params
    params.require(:cast).permit(:name, :description, :url)
  end
end
