class RemoveResumeIdFromResumeRelations < ActiveRecord::Migration
  def up
    remove_column :resume_relations, :resume_id
      end

  def down
    add_column :resume_relations, :resume_id, :integer
  end
end
