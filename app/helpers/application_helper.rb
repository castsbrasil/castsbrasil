module ApplicationHelper

  def show_avatar(current_user)
    default_avatar = "http://lorempixel.com/26/26"
    gravatar       = Gravatar.new(current_user.email)

    avatar = gravatar.exists? ? gravatar.image_url : default_avatar

    image_tag(avatar)
  end

end
