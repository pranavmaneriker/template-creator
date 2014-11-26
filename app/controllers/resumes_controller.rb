class ResumesController < ApplicationController

	before_filter :signed_in_user
	#before_filter :signed_in_user, only: [ :home ] 

	def home
	end

	def createpage
		
	end

	def create

	end

	def viewlist
		@resume_list = current_user.resume_relations.all
	end

	def postdata
		#creates new with this data
			@rname = params[:rname]
			
			@old_resume = current_user.resume_relations.find_by_resume_filename(@rname)
			if @old_resume.nil?
				
				@new_resume_relations_entry = current_user.resume_relations.build(resume_filename: @rname)
				@new_resume_relations_entry.save()
				@new_id = @new_resume_relations_entry.id

				#save the actual resume
				@name = params[:name]
				@resume_data_name = @new_resume_relations_entry.resume_data_values.build(field_name: "name", field_data: @name)
				@resume_data_name.save()

				#ends here

				flash[:success] =  "Successfully created resume!"
				redirect_to resumes_viewlist_path
				#redirect_to resume_view_path
			else
				flash[:error] = "Name already in use. You forced the button to click. Now we force you to reenter the data"
				redirect_to resumes_createpage_path
			end
			#change this to created path
	end

	def checkdata
		@new_name = params[:rname]
		@old_r = current_user.resume_relations.find_by_resume_filename(@new_name)
		if @old_r.nil?
			render :json => {"valid" => "true"}
		else
			render :json => {"valid" => "false"}
		end
	end

	def viewedit
		@res_id = params[:resume_id]
		@resume = current_user.resume_relations.find(@res_id).resume_data_values
	end

	def delete
		@res_id = params[:resume_id]
		@rec = current_user.resume_relations.find(@res_id)
		@rec.destroy
		flash[:success] = "Deleted the resume successfully"
		redirect_to resumes_viewlist_path
	end

	def createtemplate
	end
end
