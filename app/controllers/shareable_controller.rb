class ShareableController < ApplicationController
  
  before_filter :set_titles
  before_filter :candidate_signup, :only => [:candidate_profile_public]
  
  private
  
  	def candidate_signup
  		session[:candidate_full_name] = params[:candidate_full_name]
  	end

    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'shareable profile'
    end
end
