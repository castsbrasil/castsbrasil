class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    controller_name = params[:controller]
    namespace       = controller_path.split('/').first

    if user_signed_in?
      "user"
    else
      if namespace == "root"
        "application"
      elsif namespace == "devise"
        "devise"
      end
    end
  end
end
