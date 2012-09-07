class CreateSnippetDetails < ActiveRecord::Migration
  def change
    create_table :snippet_details do |t|
      t.integer :snippet_id, :null => false
      t.text :detail,        :null => false
      t.has_attached_file    :photo
      t.has_attached_file    :video
      t.timestamps
    end
    add_index :snippet_details, :snippet_id
  end
end
