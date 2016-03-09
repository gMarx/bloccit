class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.references :commented, polymorphic: true, index: true
    end

    remove_column :comments, :post_id
  end
end
