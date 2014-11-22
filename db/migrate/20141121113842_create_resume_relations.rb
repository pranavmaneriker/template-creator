class CreateResumeRelations < ActiveRecord::Migration
  def change
    create_table :resume_relations do |t|
      t.integer :resume_id
      t.integer :user_id

      t.timestamps
    end

    add_index :resume_relations, :user_id
    add_index :resume_relations, :resume_id

    add_index :resume_relations, [:user_id, :resume_id], unique: true 

  end
end
