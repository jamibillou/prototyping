module ApplicationHelper
  
  def page_title 
    @page_title.nil? ? '' : @page_title
  end
  
  def page_subtitle 
    @page_subtitle.nil? ? '' : @page_subtitle
  end
  
  def active?(action_name)
    'active' if controller.action_name == action_name
  end
end
