class Dashboard::ApplicationController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
end
