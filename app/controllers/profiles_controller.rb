class ProfilesController < ApplicationController
  before_action :authenticate_user!
  helper_method :resource, :resource_class, :resource_name


  def update
    if current_user.profile.update_attributes(valid_params(params))
      redirect_to edit_user_registration_path
    else
      render 'devise/registrations/edit'
    end
  end

  protected

  def resource
    current_user
  end

  def resource_class
    User
  end

  def resource_name
    'user'
  end

  def valid_params(params)
    params.require(:profile).permit(:first_name, :last_name, links_attributes: [:id, :name, :url, :_destroy])
  end
end
