class Authorization
  class Oauth
    def self.find_or_create_by(oauth, user)
      authorization = Authorization.find_from_oauth(oauth).first_or_initialize
      authorization.set_attributes_from_oauth(oauth)
      authorization.associate_user_from(oauth, user)
      authorization.save
      authorization
    end
  end
end