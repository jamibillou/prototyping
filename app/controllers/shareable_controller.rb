class ShareableController < ApplicationController
  
  before_filter :set_titles
  
  private
  
    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'sharable profile'
    end
end
