module ApplicationHelper

  def show_avatar(current_user)
    avatar = if current_user.authorizations.github.present?
      current_user.authorizations.github.avatar_url
    else
      default_avatar = "http://lorempixel.com/26/26/"
      gravatar = Gravatar.new(current_user.email)
      gravatar.exists? ? gravatar.url : default_avatar
    end

    image_tag(avatar, class: 'avatar')
  end

end
