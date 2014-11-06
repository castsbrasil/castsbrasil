module ApplicationHelper
  def show_avatar(current_user)
    default_avatar = "http://lorempixel.com/26/26/"
    avatar = current_user.profile.avatar.present? ? current_user.profile.avatar : default_avatar
    image_tag(avatar, class: 'avatar')
  end
end
