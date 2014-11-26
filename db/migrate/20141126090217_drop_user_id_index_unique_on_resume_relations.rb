class DropUserIdIndexUniqueOnResumeRelations < ActiveRecord::Migration
  def up
  	remove_index :resume_relations, [:user_id, :resume_id]
  end

  def down
  	add_index :resume_relations, [:user_id, :resume_id], unique: true 
  end
end
