class ResumeRelation < ActiveRecord::Base
  attr_accessible :user_id, :resume_id, :resume_filename, :resume_html
  has_attached_file :resume_html,
  	:path => ":rails_root/uploads/:class/:id/:basename.:extension"

  do_not_validate_attachment_file_type :resume_html

  belongs_to :user
  has_many :resume_data_values, foreign_key: 'resume_id', dependent: :destroy 
end
