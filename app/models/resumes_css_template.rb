class ResumesCssTemplate < ActiveRecord::Base
  attr_accessible :template_name
    has_attached_file :template_file,
  	:path => ":rails_root/uploads_css/:id/:basename.:extension"

  do_not_validate_attachment_file_type :template_file
end
