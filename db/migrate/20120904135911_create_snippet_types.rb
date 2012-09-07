class CreateSnippetTypes < ActiveRecord::Migration
  def change
    create_table :snippet_types do |t|
      t.string :name,        :null => false, :limit => 20
      t.string :description, :null => false, :limit => 250
      t.timestamps
    end
    add_index :snippet_types, :name, :unique => true
  end
end
