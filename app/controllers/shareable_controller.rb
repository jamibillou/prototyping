class ShareableController < ApplicationController
  
  before_filter       :set_titles
  before_filter       :candidate_signup,          :only => :candidate_profile
  skip_before_filter  :verify_authenticity_token, :only => [:candidate_profile, :candidate_profile_public, :candidate_profile_others]
  
  def candidate_profile
    flash.now[:success] = params[:success] unless params[:success].nil?
  end
  
  def candidate_profile_email_share
    @default_message = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
  end
  
  def candidate_profile_social_share
    @default_message = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
  end
  
  def candidate_profile_others
    default_messagge = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
    @message = (params[:sharer].nil? || params[:sharer][:message].empty?) ? default_messagge : params[:sharer][:message]
  end
  
  private
  
    def candidate_signup
      if params[:candidate]
        if params[:candidate][:full_name].empty?
          session[:candidate] = default_candidate
        else
          session[:candidate] = params[:candidate]
          session[:candidate][:pic] = 'default_user.jpg'
        end
      end
    end

    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'shareable profile'
    end

    def default_candidate
      return { :pic => 'wansa.jpg', :full_name => 'Wansa Sooksomwat', :city => 'Amsterdam', :country => 'Netherlands', 
               :role => 'Retail Sales', :company => 'Esprit', :experience => '1', 
               :education => 'HBO Bachelor in Communication & Media', 
               :pro_skill_1 => { :name => 'External communication', :level => 'advanced'},
               :pro_skill_2 => { :name => 'Event planning', :level => 'advanced'},
               :pro_skill_3 => { :name => 'Writing', :level => 'intermediate'},
               :inter_skill_1 => { :name => 'Good team mate', :level => 'expert'},
               :inter_skill_2 => { :name => 'Attention to details', :level => 'intermediate'},
               :inter_skill_3 => { :name => 'Organization', :level => 'intermediate'},
               :catchphrase => "Communications isn't what a company says, it's everything else it does." }
    end
end
