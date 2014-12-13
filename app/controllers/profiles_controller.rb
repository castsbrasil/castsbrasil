class ProfilesController < AuthorizedController
  helper_method :resource, :resource_class, :resource_name

  def update
    if current_user.profile.update_attributes(profile_params)
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

  def profile_params
    params.require(:profile).permit(:first_name,
                                    :last_name,
                                    links_attributes: %i(id name url _destroy))
  end
end
