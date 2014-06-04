module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!

    def all
      user = User.from_omniauth(env["omniauth.auth"], current_user)
      if user.persisted?
        sign_in_and_redirect(user, event: :authentication)
        set_flash_message(:notice, :success, kind: params[:action].to_s.capitalize)
      else
        session["devise.user_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    User::SOCIALS.each do |social|
      alias_method social, :all
    end
  end
end