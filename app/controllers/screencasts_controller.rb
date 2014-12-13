class ScreencastsController < AuthorizedController
  def index
    @casts = CastCollection.all
  end

  def show
    @cast = Cast.find_by_param(params[:id])
  end
end
