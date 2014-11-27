class HomepagesCssTemplate < ActiveRecord::Base
    attr_accessible :template_name, :template_file
    has_attached_file :template_file,
  		:path => ":rails_root/uploads_css_home/:id/:basename.:extension"

  	do_not_validate_attachment_file_type :template_file
end
