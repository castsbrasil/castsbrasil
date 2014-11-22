class AuthorizedController < ApplicationController
  before_filter :authenticate_user!
  # load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
