class AddResumeFilenameToResumeRelations < ActiveRecord::Migration
  def change
  	add_column :resume_relations, :resume_filename, :string
  	add_index :resume_relations, :resume_filename
  end
end
