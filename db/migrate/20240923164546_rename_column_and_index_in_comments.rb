class RenameColumnAndIndexInComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :comentable_id, :commentable_id
    rename_column :comments, :comentable_type, :commentable_type

    remove_index :comments, name: :index_comments_on_comentable
    add_index :comments, %w[commentable_type commentable_id], name: 'index_comments_on_commentable'
  end
end
