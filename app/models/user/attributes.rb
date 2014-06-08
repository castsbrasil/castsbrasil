class User
  class Attributes
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def set_from_oauth(oauth)
      user.skip_confirmation!
      user.password = Devise.friendly_token[0, 20]
      user.email    = oauth.info.email                     # Others
      user.email  ||= "#{SecureRandom.hex(5)}@change.me"   # Twitter
      user
    end
  end
end