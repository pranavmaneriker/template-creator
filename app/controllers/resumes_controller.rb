class ResumesController < ApplicationController

	before_filter :signed_in_user
	#before_filter :signed_in_user, only: [ :home ] 

	def home
	end

	def createpage
	end

	def create
	end
end
