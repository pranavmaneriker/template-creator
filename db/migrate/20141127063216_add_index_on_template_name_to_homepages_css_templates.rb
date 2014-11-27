class AddIndexOnTemplateNameToHomepagesCssTemplates < ActiveRecord::Migration
  def change
  	add_index :homepages_css_templates, :template_name
  end
end
