class HomepagesController < ApplicationController

	before_filter :signed_in_user, only: [ :home, :create, :postdata, :checkdata, :view ] 
	
	def home
	end
	
	def create
		@css_list = HomepagesCssTemplate.all
	end

	def postdata
		ActiveRecord::Base.transaction do
			@new_name = params[:rname]
			@old_r = current_user.homepages.find_by_homepage_name(@new_name)
			if !(@old_r.blank?) || (@new_name.blank?)
				flash[:error] = "You forcibly posted an invalid html file. Your html file will be lost"
				redirect_to root_url
			else
				bootstrap = File.read(Rails.root.join('public','bootstrap.min.css'));
				file = StringIO.new('<html><body><script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script><style>'+bootstrap+'</style>' + params[:htmlpage] + '</body></html>')

				file.class.class_eval { attr_accessor :original_filename, :content_type }
	  			file.original_filename = @new_name + ".html"
	  			file.content_type = "text/html" # you could set this manually aswell if needed e.g 'application/pdf'
				current_user.homepages.build(homepage_name:@new_name, homepage_html: file).save()
			end
			file.close
		end
	end

	def checkdata
		@new_name = params[:rname]
		@old_r = current_user.homepages.find_by_homepage_name(@new_name)
		if @old_r.blank? && !(@new_name.blank?)
			render :json => {"valid" => "true"}
		else
			render :json => {"valid" => "false"}
		end
	end

	def view
		@homepage_list = current_user.homepages.all
	end

	def delete
		@page =  current_user.homepages.find(params[:homepage_id])
		@page.destroy
		flash[:success] = "Deleted the resume successfully"
		redirect_to resumes_viewlist_path
	end

	def download
		@homepage = current_user.homepages.find(params[:homepage_id])
		
		if @homepage.nil?
			flash[:error] = "Invalid parameters entered"
			redirect_to homepages_view_path
		end
		send_file @homepage.homepage_html.path, filename: @homepage.homepage_name, type: "text/html", disposition: 'inline'
	end

	def cssapi
		@css_fname = params[:css_template]
		send_data Paperclip.io_adapters.for(HomepagesCssTemplate.find_by_template_name(@css_fname).template_file).read
	end
end
