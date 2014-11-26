class RenameResumeDataToResumeDataValues < ActiveRecord::Migration
  def up
  	rename_table :resume_data, :resume_data_values
  end

  def down
  	rename_table :resume_data_values, :resume_data
  end
end
