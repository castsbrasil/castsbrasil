require 'uri'

module ApplicationHelper
  def show_avatar
    avatar = current_user.profile.avatar.present? ? current_user.profile.avatar : "http://lorempixel.com/26/26/"
    image_tag(avatar, class: 'avatar')
  end

  def markdown(text)
    unless text.nil?
      options = { autolink: true, highlight: true, fenced_code_blocks: true }
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, options)
      markdown.render(text).html_safe
    end
  end

  def body(&block)
    content = capture(&block)
    content_tag(:body, content, controller: params[:controller].gsub('/', ' ').titleize.gsub(' ', '.'),
      action: action_name.capitalize)
  end

  def parse_youtube(url)
    regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    url.match(regex)[1]
  end

  def youtube_image_preview(url)
    id = parse_youtube(url)
    "http://img.youtube.com/vi/#{id}/0.jpg"
  end
end
