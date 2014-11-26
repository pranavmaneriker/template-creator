class AddAttachmentTemplateFileToResumesCssTemplates < ActiveRecord::Migration
  def self.up
    change_table :resumes_css_templates do |t|
      t.attachment :template_file
    end
  end

  def self.down
    remove_attachment :resumes_css_templates, :template_file
  end
end
