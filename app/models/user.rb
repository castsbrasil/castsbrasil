class User < ActiveRecord::Base
  SOCIALS = [:facebook, :github, :twitter, :linkedin]

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: SOCIALS

  has_many :authorizations, dependent: :destroy

  def self.new_with_session(params, session)
    if session["devise.user_data"]
      new(session["devise.user_data"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s,
                                        :token => auth.credentials.token,
                                        :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth['info']['email']).first : current_user
      if user.blank?
        user = User.new
        user.skip_confirmation!
        user.password = Devise.friendly_token[0, 20]
        user.email = ( auth.provider == "twitter" ?  "change-me-#{SecureRandom.hex(5)}@temporary.com" : auth.info.email )
        user.save
      end
      authorization.profile_page = auth.info.urls.first.last
      authorization.nick_name = ( auth.provider == 'facebook' ?  auth.info.name : auth.info.nickname )
      authorization.user = user
      authorization.save
    end
    authorization.user
  end
end