module ShareableHelper

  def candidate_signed? 
    !session[:candidate].nil?
  end	
end
