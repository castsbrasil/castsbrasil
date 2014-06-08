class Authorization
  class Associate
    attr_reader :authorization

    def initialize(authorization)
      @authorization = authorization
    end

    def user_from(oauth, current_user)
      case false
        when @authorization.user.nil?
        when current_user.nil?
          @authorization.user = current_user
        when User.where(email: oauth['info']['email']).blank?
          @authorization.user = User.where(email: oauth['info']['email']).first
        else
          @authorization.user = User.new_from_oauth(oauth)
      end
      @authorization
    end
  end
end