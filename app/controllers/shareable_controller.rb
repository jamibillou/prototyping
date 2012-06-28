class ShareableController < ApplicationController
  
  before_filter       :set_titles
  before_filter       :candidate_signup,          :only => :candidate_profile_public
  skip_before_filter  :verify_authenticity_token, :only => :candidate_profile_public

  private
  
  	def candidate_signup
      if params[:candidate_full_name]
        session[:candidate_full_name] = params[:candidate_full_name]
        session[:candidate_city] = params[:candidate_city]
        session[:candidate_country] = params[:candidate_country]
        session[:candidate_role] = params[:candidate_role]
        session[:candidate_company] = params[:candidate_company]
        session[:candidate_experience] = params[:candidate_experience]
        session[:candidate_education] = params[:candidate_education]
        session[:candidate_pro_skill_1] = params[:candidate_pro_skill_1]
        session[:candidate_pro_skill_2] = params[:candidate_pro_skill_2]
        session[:candidate_pro_skill_3] = params[:candidate_pro_skill_3]
        session[:candidate_inter_skill_1] = params[:candidate_inter_skill_1]
        session[:candidate_inter_skill_2] = params[:candidate_inter_skill_2]
        session[:candidate_inter_skill_3] = params[:candidate_inter_skill_3]
        session[:candidate_pro_skill_level_1] = params[:candidate_pro_skill_level_1]
        session[:candidate_pro_skill_level_2] = params[:candidate_pro_skill_level_2]
        session[:candidate_pro_skill_level_3] = params[:candidate_pro_skill_level_3]
        session[:candidate_inter_skill_level_1] = params[:candidate_inter_skill_level_1]
        session[:candidate_inter_skill_level_2] = params[:candidate_inter_skill_level_2]
        session[:candidate_inter_skill_level_3] = params[:candidate_inter_skill_level_3]
        session[:candidate_catchphrase] = params[:candidate_catchphrase]
      end
    end

    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'shareable profile'
    end
end
