class Homepage < ActiveRecord::Base
  attr_accessible :homepage_name, :user_id, :homepage_html
  has_attached_file :homepage_html,
  	:path => ":rails_root/uploads_pages/:id/:basename.:extension"

  do_not_validate_attachment_file_type :homepage_html

  belongs_to :user
end
