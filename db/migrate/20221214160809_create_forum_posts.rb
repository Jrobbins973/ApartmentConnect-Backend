class CreateForumPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_posts do |t|
      t.integer :tenant_id
      t.string :text

      t.timestamps
    end
  end
end
