class AjaxController < ApplicationController

	def switch_mode
		session[:mode] = params[:mode]	
	end

end
