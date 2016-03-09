class AddCommentedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commented_id, :integer
    add_column :comments, :commented_type, :string
    add_index :comments, [:commented_id, :commented_type]

    remove_column :comments, :topic_id
    remove_column :comments, :post_id

  end
end
