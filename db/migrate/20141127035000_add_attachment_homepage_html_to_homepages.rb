class AddAttachmentHomepageHtmlToHomepages < ActiveRecord::Migration
  def self.up
    change_table :homepages do |t|
      t.attachment :homepage_html
    end
  end

  def self.down
    remove_attachment :homepages, :homepage_html
  end
end
