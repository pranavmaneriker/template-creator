class AddIndexToResumeDataOnResumeIdAndField < ActiveRecord::Migration
  def change
	  add_index :resume_data, :resume_id
	  add_index :resume_data, :field
  end
end
