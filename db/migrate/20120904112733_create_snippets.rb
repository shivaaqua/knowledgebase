class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string  :title,           :null => false, :limit => 50
      t.integer :snippet_type_id, :null => false
      t.text    :description,     :null => false
      t.text    :detail,          :null => false
      t.timestamps
    end
    add_index :snippets, [:title, :snippet_type_id], :unique => true
  end
end
