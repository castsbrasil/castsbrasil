module ApplicationHelper
  def show_avatar
    avatar = current_user.profile.avatar.present? ? current_user.profile.avatar : "http://lorempixel.com/26/26/"
    image_tag(avatar, class: 'avatar')
  end
end
