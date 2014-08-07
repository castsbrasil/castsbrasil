class Authorization
  class Attributes
    attr_reader :authorization

    def initialize(authorization)
      @authorization = authorization
    end

    def set_from_oauth(oauth)
      authorization.profile_page ||= oauth.info.urls.first.last
      authorization.nick_name    ||= oauth.info.nickname
      authorization
    end
  end
end