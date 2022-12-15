class CreateForumPostReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_post_replies do |t|
      t.integer :forum_post_id
      t.integer :tenant_id
      t.string :category
      t.datetime :date_posted

      t.timestamps
    end
  end
end
