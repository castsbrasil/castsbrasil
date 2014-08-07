module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!
    self.responder = OauthResponder

    def create
      @user = User.find_or_initialize_by_oauth(env["omniauth.auth"], current_user)
      sign_in(@user) if @user.save
      respond_with(@user)
    end

    User::SOCIALS.each do |social|
      alias_method social, :create
    end
  end
end
