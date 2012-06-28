class ShareableController < ApplicationController
  
  before_filter       :set_titles
  before_filter       :candidate_signup,          :only => :candidate_profile_public
  skip_before_filter  :verify_authenticity_token, :only => :candidate_profile_public

  private
  
  	def candidate_signup
      if params[:candidate]
        session[:candidate] = params[:candidate]
      end
    end

    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'shareable profile'
    end
end
