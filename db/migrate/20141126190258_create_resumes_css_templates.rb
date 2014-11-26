class CreateResumesCssTemplates < ActiveRecord::Migration
  def change
    create_table :resumes_css_templates do |t|
      t.string :template_name

      t.timestamps
    end
  end
end
