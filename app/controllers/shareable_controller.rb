class ShareableController < ApplicationController
  
  before_filter :set_titles
  
  def candidate_profile_public
  end
  
  def recruiter_starts_discussion
  end
  
  def recruiter_isnt_interested
  end
  
  def candidate_profile_sent
  end
  
  def recruiter_answers_yes
  end
  
  def recruiter_answers_no
  end
  
  def candidate_interactions
  end
  
  def recruiter_profile
  end
  
  def candidate_matches
  end
  
  def candidate_matches2
  end
  
  def candidate_matches3
  end
  
  private
  
    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'sharable profile'
    end
end
