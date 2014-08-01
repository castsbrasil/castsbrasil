module ApplicationHelper
  def _controller_name
    params[:controller].gsub('/', ' ').titleize.gsub(' ', '.').to_s 
  end

  def _action_name
    action_name.capitalize.to_s
  end
end
