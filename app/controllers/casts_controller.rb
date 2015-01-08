class CastsController < AuthorizedController
  def index
    @casts = CastCollection.all
    respond_with(@casts)
  end

  def create
    @cast = current_user.casts.new(cast_params)
    @cast.save
    respond_with(@cast)
  end

  def edit
    @cast = current_user.casts.find(params[:id])
    respond_with(@cast)
  end

  def update
    @cast = current_user.casts.find_by_param(params[:id])
    @cast.update(cast_params)
    respond_with(@cast)
  end

  protected

  def cast_params
    params.require(:cast).permit(:name, :description, :notes, :url)
  end
end
