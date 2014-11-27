class CreateHomepages < ActiveRecord::Migration
  def change
    create_table :homepages do |t|
      t.integer :user_id
      t.string :homepage_name

      t.timestamps
    end

    add_index :homepages, :user_id
    add_index :homepages, :homepage_name
  end
end
