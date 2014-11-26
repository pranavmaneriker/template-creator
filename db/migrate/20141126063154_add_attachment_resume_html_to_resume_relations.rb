class AddAttachmentResumeHtmlToResumeRelations < ActiveRecord::Migration
  def self.up
    change_table :resume_relations do |t|
      t.attachment :resume_html
    end
  end

  def self.down
    remove_attachment :resume_relations, :resume_html
  end
end
