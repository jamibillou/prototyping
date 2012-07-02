module ShareableHelper
  
  def candidate_demo?
    session[:candidate_demo] == true
  end
  
  def recruiter_demo?
    session[:recruiter_demo] == true
  end
end
