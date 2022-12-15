class AddCategoryToForumPost < ActiveRecord::Migration[7.0]
  def change
    add_column :forum_posts, :category, :string
  end
end
