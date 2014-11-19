module ApplicationHelper
	#return full title
	def full_title(page_title)
		base_title = "Sample app"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
