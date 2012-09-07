class AddAttachmentPhotoToSnippets < ActiveRecord::Migration
  def self.up
    change_table :snippets do |t|
      t.has_attached_file :photo
      t.has_attached_file :video
    end
  end

  def self.down
    drop_attached_file :snippets, :photo
    drop_attached_file :snippets, :video
  end
end
