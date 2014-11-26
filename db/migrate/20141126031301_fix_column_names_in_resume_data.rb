class FixColumnNamesInResumeData < ActiveRecord::Migration
  def change
  	rename_column :resume_data, :field, :field_name
  	rename_column :resume_data, :data, :field_data
  end
end
