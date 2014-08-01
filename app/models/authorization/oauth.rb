class Authorization
  class Oauth
    def self.find_or_initialize_by(oauth, user)
      authorization = Authorization.find_from_oauth(oauth).first_or_initialize
      authorization.set_attributes_from_oauth(oauth)
      authorization.associate_user_from(oauth, user)
      authorization
    end
  end
end
