module ShareableHelper

	def candidate_signed? 
		!session[:candidate].empty?
	end	
end
