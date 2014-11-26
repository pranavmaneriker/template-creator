class ResumeDataValue < ActiveRecord::Base
  attr_accessible :field_name, :resume_id, :field_data
  belongs_to :resume_relation
end
