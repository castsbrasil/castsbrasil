module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!

    def create
      @authorization = Authorization.find_or_create_by_oauth(env["omniauth.auth"], current_user)
      if @authorization.persisted?
        sign_in_and_redirect(@authorization.user, event: :authentication)
        set_flash_message(:notice, :success, kind: params[:action].to_s.capitalize)
      else
        redirect_to new_user_registration_url
      end
    end

    User::SOCIALS.each do |social|
      alias_method social, :create
    end
  end
end