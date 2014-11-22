class OauthResponder < ApplicationResponder
  def set_flash_message?
    @flash != false
  end

  def navigation_behavior(error)
    redirect_to navigation_location
  end
end
