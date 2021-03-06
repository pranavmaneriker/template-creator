class ResumesController < ApplicationController

	before_filter :signed_in_user
	#before_filter :signed_in_user, only: [ :home ] 

	def home
	end

	def createpage
		@css_list = ResumesCssTemplate.all
	end

	def create

	end

	def viewlist
		@resume_list = current_user.resume_relations.all
	end

	def postdata
		ActiveRecord::Base.transaction do
		#creates new with this data
		#destroy session variables after update TODO
		if !(session[:existing].nil?)
			@res_id = session[:resume_id];
			if !(current_user.resume_relations.find(@res_id).nil?)
				current_user.resume_relations.find(@res_id).destroy
			end
			session.delete(:existing)
			session.delete(:resume_id)
		end
			@rname = params[:rname]
			if @rname.blank?
				flash[:error] = "Blank name not allowed. You forced the button to click. Now we force you to reenter the data"
				redirect_to resumes_createpage_path
			end
			
			bootstrap = File.read(Rails.root.join('public','bootstrap.min.css'));
			file = StringIO.new('<html><body><script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script><style>' + bootstrap + '</style>' + params[:htmlpage] + '</body></html>')

			file.class.class_eval { attr_accessor :original_filename, :content_type }
  			file.original_filename = @rname+".html"
  			file.content_type = "text/html" # you could set this manually aswell if needed e.g 'application/pdf'
			@old_resume = current_user.resume_relations.find_by_resume_filename(@rname)
			if @old_resume.nil?
				
				@new_resume_relations_entry = current_user.resume_relations.build(resume_filename: @rname, resume_html: file)

				@new_resume_relations_entry.save()
				@new_id = @new_resume_relations_entry.id

				#save the actual resume

				#css_template_name
				@new_resume_relations_entry.resume_data_values.build(field_name: "css_template", field_data: params[:css_template]).save()
				
				#name
				@name = params[:name]
				@resume_data_name = @new_resume_relations_entry.resume_data_values.build(field_name: "name", field_data: @name)
				@resume_data_name.save()


				#contact
				@contactcheck = params[:contactcheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "contactcheck", field_data: @contactcheck).save()

				@email = params[:email]
				@new_resume_relations_entry.resume_data_values.build(field_name: "email", field_data: @email).save()				

				@contact = params[:contact]
				@new_resume_relations_entry.resume_data_values.build(field_name: "contact", field_data: @contact).save()

				#education
				@edu_check = params[:educationcheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "educationcheck", field_data: @edu_check).save()

				e_index = params[:edu_index]
				@new_resume_relations_entry.resume_data_values.build(field_name: "edu_index", field_data: e_index).save()
				no = Integer(e_index) -1;
				if no>0
					(0..no).each do |i|
						is = i.to_s

						pn = "educheck"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()

						pn = "class"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()

						pn = "board"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()

						pn = "yearofpassing"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()

						pn = "grade"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()
					end
				end
				#academic acheivements
				@acad_achev_check = params[:acadAchievementscheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "acadAchievementscheck", field_data: @acad_achev_check).save()


				e_index = params[:acadachievements_index]
				@new_resume_relations_entry.resume_data_values.build(field_name: "acadachievements_index", field_data: e_index).save()
				no = Integer(e_index) - 1
				if no>0
					(0..no).each do |i|
						is = i.to_s

						pn = "acadAchievcheck"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()


						pn = "acadAchieve"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()
					end
				end
				#work ex
				@work_ex_check = params[:workExperiencecheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "workExperiencecheck", field_data: @work_ex_check).save()

				@ind = params[:workexp_index]
				@new_resume_relations_entry.resume_data_values.build(field_name: "workexp_index", field_data: @ind).save()
				no = Integer(@ind) -1
				if no>0
					(0..no).each do |i|
						is = i.to_s

						pn = "workExpEntrycheck"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()

						pn = "workexpentry"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()
					end				  
				end
				#papers
				
				@paper_check = params[:papercheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "papercheck", field_data: @paper_check).save()

				@ind = params[:paper_index]
				@new_resume_relations_entry.resume_data_values.build(field_name: "paper_index", field_data: @ind).save()
				no = Integer(@ind) -1
				if no>0
					(0..no).each do |i|
						is = i.to_s

						pn = "paperEntrycheck"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()


						pn = "paperEntry"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()
					end				  
				end
				#extra c
				@extra_c_check = params[:extraCcheck]
				@new_resume_relations_entry.resume_data_values.build(field_name: "extraCcheck", field_data: @extra_c_check).save()

				@ind = params[:extrac_index]
				@new_resume_relations_entry.resume_data_values.build(field_name: "extrac_index", field_data: @ind).save()
				no = Integer(@ind) -1
				if no>0
					(0..no).each do |i|
						is = i.to_s

						pn = "extraentrycheck"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()


						pn = "extraentry"+is
						@new_resume_relations_entry.resume_data_values.build(field_name: pn, field_data: params[pn.to_sym]).save()
					end				  
				end
				#done woohoo
				#ends here

				flash[:success] =  "Successfully created resume!"
				redirect_to resumes_viewlist_path
				#redirect_to resume_view_path
			else
				flash[:error] = "Name already in use. You forced the button to click. Now we force you to reenter the data"
				redirect_to resumes_createpage_path
			end
			#change this to created path
			file.close
		end
	end

	def checkdata
		@new_name = params[:rname]
		@old_r = current_user.resume_relations.find_by_resume_filename(@new_name)
		if @old_r.blank? && !(@new_name.blank?)
			render :json => {"valid" => "true"}
		else
			render :json => {"valid" => "false"}
		end
	end

	def viewedit
		@css_list = ResumesCssTemplate.all
		@res_id = params[:resume_id]
		session[:existing] = true
		session[:resume_id] = @res_id
		@r = current_user.resume_relations.find(@res_id).resume_data_values
		@file_name = current_user.resume_relations.find(@res_id).resume_filename
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

	def download
		@resume = current_user.resume_relations.find(params[:resume_id])
		
		if @resume.nil?
			flash[:error] = "Invalid parameters entered"
			redirect_to resumes_viewlist_path
		end
		PandocRuby.allow_file_paths = true
<<<<<<< HEAD
		
=======
>>>>>>> 1665a2b5dd157e4be2883fb4aca1cd47f56f43ca
		@reqFor = params[:format]
		case @reqFor
			when "html"
				send_file @resume.resume_html.path, filename: @resume.resume_filename, type: "text/html", disposition: 'inline'
			when "pdf"
				send_data WickedPdf.new.pdf_from_html_file(@resume.resume_html.path, :javascript_delay=>5000), filename: "download.pdf", type: "application/pdf", dispostion: "inline"	
			when "latex"
				send_data PandocRuby.convert(@resume.resume_html.path, :from => :html, :to => :latex), filename: "download.tex", type: "application/x-tex", dispostion: "inline"
			when "markdown"
				send_data PandocRuby.convert(@resume.resume_html.path, :from => :html, :to => :markdown), filename: "download.md", type: "text/markdown", dispostion: "inline"
			when "json"
				render json: @resume.resume_data_values
			else
				flash[:error] = "Invalid/unsupported format specified"
				redirect_to root_url
		end  
	end

	def cssapi
		@css_fname = params[:css_template]
		send_data Paperclip.io_adapters.for(ResumesCssTemplate.find_by_template_name(@css_fname).template_file).read
	end

	def checkcssfile
		@new_name = params[:file_name]
		@old_r = ResumesCssTemplate.find_by_template_name(@new_name)
		if @old_r.blank? && !(@new_name.blank?)
			render :json => {"valid" => "true"}
		else
			render :json => {"valid" => "false"}
		end
	end

	def postcssfile
		ActiveRecord::Base.transaction do
			@new_name = params[:file_name]
			@old_r = ResumesCssTemplate.find_by_template_name(@new_name)
			if !(@old_r.blank?) || (@new_name.blank?)
				flash[:error] = "You forcibly posted an invalid css file. Your css file will be lost"
				redirect_to root_url
			else
				file = StringIO.new('<style>' + params[:css_res] + '</style>')

				file.class.class_eval { attr_accessor :original_filename, :content_type }
	  			file.original_filename = @new_name + ".css"
	  			file.content_type = "text/css" # you could set this manually aswell if needed e.g 'application/pdf'
				ResumesCssTemplate.new(template_name:@new_name, template_file: file).save()
			end
			file.close
		end
	end
end
