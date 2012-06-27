module ShareableHelper

	def candidate_signed? 
		!session[:candidate_full_name].nil?
	end	
end
