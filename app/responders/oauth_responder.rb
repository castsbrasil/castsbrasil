class OauthResponder < ApplicationResponder
  def set_flash_message?
    @flash != false
  end

  def navigation_behavior(error)
    if has_errors?
      render 'users/omniauth_callbacks/new'
    else
      redirect_to navigation_location
    end
  end
end
