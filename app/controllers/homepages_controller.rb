class HomepagesController < ApplicationController

	before_filter :signed_in_user, only: [ :home ] 
	
	def home
	end

	def createhomepage
		
	end
	
end
