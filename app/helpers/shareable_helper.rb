module ShareableHelper

	def candidate_signed? 
		!session[:candidate][:full_name].empty?
	end	
end
