class Profile
  class Attributes
    attr_reader :profile

    def initialize(profile)
      @profile = profile
    end

    def set_from_oauth(oauth)
      if oauth.info.name.empty?
        profile.first_name = oauth.info.nickname
        return profile
      end
      names = oauth.info.name.split(' ')
      profile.first_name = names.first
      profile.last_name = names[1..-1].join(' ')
      profile
    end
  end
end
