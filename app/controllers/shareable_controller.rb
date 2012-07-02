class ShareableController < ApplicationController
  
  before_filter       :set_titles
  before_filter       :candidate_signup,          :only => :candidate_profile
  skip_before_filter  :verify_authenticity_token
  
  def candidate_profile
    flash.now[:success] = params[:success] unless params[:success].nil?
  end
  
  def candidate_profile_email_share_you
    @default_message = "Hi, I'm really keen to work for your company and would love to go over a few ideas together soon."
  end
  
  def candidate_profile_social_share_you
    @default_message = "Hi everyone, I'm looking for work these days and was wondering if you might know of someone interested? Share my profile if so!"
  end
  
  def candidate_profile_you_email
    @default_message = "Hi, I'm really keen to work for your company and would love to go over a few ideas together soon."
    session[:you] = params[:you] unless params[:you].nil?
  end
  
  def candidate_profile_you_social
    @default_message = "Hi everyone, I'm looking for work these days and was wondering if you might know of someone interested? Share my profile if so!"
    session[:you] = params[:you] unless params[:you].nil?
  end
  
  def candidate_profile_email_share_others
    @default_message = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
  end
  
  def candidate_profile_social_share_others
    @default_message = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
  end
  
  def candidate_profile_others
    @default_message = "Hi, I was looking at this profile and thought you might be interested. What do you think?"
    session[:sharer] = params[:sharer] unless params[:sharer].nil?
    @from_path = (params[:from_path].nil? ? candidate_profile_path : params[:from_path])
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
               :pro_skill_3 => { :name => 'Writing', :level => 'intermediate',},
               :pro_star => 'candidate_pro_skill_star_2',
               :inter_skill_1 => { :name => 'Good team mate', :level => 'expert'},
               :inter_skill_2 => { :name => 'Attention to details', :level => 'intermediate'},
               :inter_skill_3 => { :name => 'Organization', :level => 'intermediate'},
               :inter_star => 'candidate_inter_skill_star_1',
               :catchphrase => "Communications isn't what a company says, it's everything else it does." }
    end
end
