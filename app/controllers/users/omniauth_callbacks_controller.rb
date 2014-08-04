module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!
    self.responder = OauthResponder

    def create
      @user = User.find_or_initialize_by_oauth(env["omniauth.auth"], current_user)
      if @user.save
        sign_in(@user)
      else
        session[:omniauth] = env["omniauth.auth"].except('extra')
      end
      respond_with(@user)
    end

    User::SOCIALS.each do |social|
      alias_method social, :create
    end
  end
end
