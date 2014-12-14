class ApplicationController < Zertico::Controller
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def layout_by_resource
    return 'devise' if devise_controller?
    'application'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |params|
      params.permit(:email,
                    :password,
                    :password_confirmation,
                    :remember_me,
                    profile_attributes: %i(first_name last_name))
    end
  end
end
