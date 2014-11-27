class CreateHomepagesCssTemplates < ActiveRecord::Migration
  def change
    create_table :homepages_css_templates do |t|
    	t.string :template_name
      t.timestamps
    end
  end
end
