class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id,      :null => false
      t.integer :snippet_id,   :null => false
      t.text    :comment,      :null => false
      t.boolean :question,     :null => false, :default => true
      t.integer :question_id
      t.timestamps
    end
    add_index :comments, [:snippet_id, :user_id]
    add_index :comments, [:question, :question_id]
  end
end
