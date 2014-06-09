module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_filter :authenticate_user!
    self.responder = OauthResponder

    def create
      @authorization = Authorization.find_or_create_by_oauth(env["omniauth.auth"], current_user)
      sign_in(@authorization.user) if @authorization.persisted?
      respond_with(@authorization.user)
    end

    User::SOCIALS.each do |social|
      alias_method social, :create
    end
  end
end