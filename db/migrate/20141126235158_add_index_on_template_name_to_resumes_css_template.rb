class AddIndexOnTemplateNameToResumesCssTemplate < ActiveRecord::Migration
  def change
  	add_index :resumes_css_templates, :template_name
  end
end
