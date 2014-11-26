class ResumeRelation < ActiveRecord::Base
  attr_accessible :user_id, :resume_id, :resume_filename

  belongs_to :user
  has_many :resume_data_values, foreign_key: 'resume_id', dependent: :destroy 
end
