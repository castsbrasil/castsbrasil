module ApplicationHelper
  def _controller_name
    params[:controller].gsub('/', ' ').titleize.gsub(' ', '.').to_s 
  end

  def _action_name
    action_name.capitalize.to_s
  end

  def flash_messages
    flash.each do |key, value|
      content_tag(:div, value, class: "flash #{key}")
    end
  end
end
