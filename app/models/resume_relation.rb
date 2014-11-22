class ResumeRelation < ActiveRecord::Base
  attr_accessible :user_id, :resume_id

  belongs_to :user
  has_many :resume_data, foreign_key: 'resume_id', dependent: :destroy 
end
