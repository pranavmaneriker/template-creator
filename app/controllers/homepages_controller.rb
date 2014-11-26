class HomepagesController < ApplicationController

	before_filter :signed_in_user, only: [ :home ] 
	
	def home
	end
	
	def create
	end
end
