class ShareableController < ApplicationController
  
  before_filter       :set_titles
  before_filter       :signup_candidate, :only => :candidate_profile
  before_filter       :signup_recruiter, :only => :recruiter_profile
  after_filter        :candidate_demo,   :only => :candidate_signup
  after_filter        :recruiter_demo,   :only => :recruiter_signup
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
  
  def candidate_profile_public
    flash.now[:success] = params[:success] unless params[:success].nil?
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
    
    def set_titles
      @page_title = 'Prototypes'
      @page_subtitle = 'shareable profile'
    end
  
    def signup_candidate
      if params[:candidate]
        if params[:candidate][:full_name].empty?
          session[:candidate] = default_candidate
        else
          session[:candidate] = params[:candidate]
          session[:candidate][:pic] = 'default_user.jpg'
        end
      end
      session[:recruiter] = default_recruiter
    end

    def default_candidate
      if session[:candidate_demo]
        { :pic => 'wansa.jpg', :full_name => 'Wansa Sooksomwat', :city => 'Amsterdam', :country => 'Netherlands', 
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
      elsif session[:recruiter_demo]
        { :pic => 'carole.jpg', :full_name => 'Carole Dhelens', :city => 'Marseille', :country => 'France', 
        :role => 'Pharmacist resident', :company => 'Hopital de Marseille', :experience => '2', 
        :education => 'PhD in Pharmacy', 
        :pro_skill_1 => { :name => 'Team working', :level => 'advanced'},
        :pro_skill_2 => { :name => 'Patient pool management', :level => 'beginner'},
        :pro_skill_3 => { :name => 'Writing', :level => 'expert'},
        :pro_star => 'candidate_pro_skill_star_3',
        :inter_skill_1 => { :name => 'Hard worker', :level => 'expert'},
        :inter_skill_2 => { :name => 'Organization', :level => 'intermediate'},
        :inter_skill_3 => { :name => 'Patience', :level => 'intermediate'},
        :inter_star => 'candidate_inter_skill_star_1',
        :catchphrase => "I've almost finished my complete pharmacist studies, and I'm looking for a first fulltime job." }
      end
    end
    
    def candidate_demo
      session[:candidate_demo] = true
      session[:recruiter_demo] = false
      session[:recruiter] = nil unless session[:recruiter].nil?
    end

    def signup_recruiter
      if params[:recruiter]
        if params[:recruiter][:full_name].empty?
          session[:recruiter] = default_recruiter
        else
          session[:recruiter] = params[:recruiter]
          session[:recruiter][:pic] = 'default_user.jpg'
        end
      end
      session[:candidate] = default_candidate
    end

    def default_recruiter
      { :pic => 'dom.jpg', :full_name => 'Dominic Matheron', :company => 'Viadeo', :city => 'Amsterdam',
        :country => 'Netherlands', 
        :role_1 => { :name => 'Programmers', :level => 'required' }, 
        :role_2 => { :name => 'Designers', :level => 'intermediate' }, 
        :role_3 => { :name => 'Copywriters', :level => 'not_a_priority' },
        :quality_1 => { :name => 'Honesty', :level => 'urgent' }, 
        :quality_2 => { :name => 'Friendliness', :level => 'required' }, 
        :quality_3 => { :name => 'Punctuality', :level => 'intermediate' }, 
        :quality_star => 'recruiter_quality_star_1', :flexible_1 => 'Education',
        :profile_1 => { :title => 'Graphic Designer', :city => 'Amsterdam', :country => 'Netherlands', :experience => '5yrs',
                        :education => 'HBO or similar degree', :skill_1 => 'Visual Design', :skill_2 => 'Interaction Design',
                        :skill_3 => 'Quick Prototyping'},
        :profile_2 => { :title => 'Mobile Developer', :city => 'Amsterdam', :country => 'Netherlands', :experience => '2yrs',
                        :education => 'Bachelor in sone serious school', :skill_1 => 'iOS', :skill_2 => 'Android',
                        :skill_3 => 'Extremely Rigorous', :star => 'recruiter_profile_2_star_3'},
        :profile_3 => { :title => 'Project Manager', :city => 'Paris', :country => 'France', :experience => '5-8y',
                        :education => 'Experience is the key here', :skill_1 => 'Experienced at Scaling', :skill_2 => 'Agile',
                        :skill_3 => 'Open to oustide input', :star => 'recruiter_profile_3_star_3'},
        :profile_4 => { :title => 'Italian Copywriter', :city => 'Paris', :country => 'France', :experience => '1yr',
                        :education => 'Master in Translation', :skill_1 => 'Native Speaker', :skill_2 => 'Intelligent',
                        :skill_3 => 'Flexible', :star => 'recruiter_profile_4_star_1'} }
    end

    def recruiter_demo
      session[:candidate_demo] = false
      session[:recruiter_demo] = true
      session[:candidate] = default_candidate     
    end
end
