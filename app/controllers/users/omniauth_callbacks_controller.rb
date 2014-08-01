module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!
    self.responder = OauthResponder

    def create
      omniauth_data = env["omniauth.auth"] || OmniAuth::AuthHash.new(session[:omniauth])
      @user = User.find_or_initialize_by_oauth(omniauth_data, current_user)
      @user.email = params[:user][:email] if params[:user]
      if @user.save
        session[:omniauth] = nil
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
