module ApplicationHelper
  
  def title 
    base_title = 'Engaccino | Bootstrap prototyping'
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
end
