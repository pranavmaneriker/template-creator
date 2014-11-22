class CreateResumeData < ActiveRecord::Migration
  def change
    create_table :resume_data do |t|
      t.integer :resume_id
      t.string :field
      t.string :data

      t.timestamps
    end
  end

end
