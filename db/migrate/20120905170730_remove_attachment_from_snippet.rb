class RemoveAttachmentFromSnippet < ActiveRecord::Migration
  def up
    drop_attached_file :snippets, :photo
    drop_attached_file :snippets, :video
    remove_column :snippets, :detail
  end

  def down
    change_table :snippets do |t|
      t.has_attached_file :photo
      t.has_attached_file :video
    end
    add_column :snippets, :detail, :text, :null => false
  end
end
