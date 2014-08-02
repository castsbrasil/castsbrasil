class Users::Auth::ConfirmController < ApplicationController
  def create
    omniauth_data = OmniAuth::AuthHash.new(session[:omniauth])
    @user = User.find_or_initialize_by_oauth(omniauth_data, current_user)
    @user.email = params[:user][:email] if params[:user]
    if @user.save
      session[:omniauth] = nil
      sign_in(@user)
    end
    respond_with(@user)
  end
end