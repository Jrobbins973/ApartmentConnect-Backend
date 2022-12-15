class ChangeCategoryToTextOnReplies < ActiveRecord::Migration[7.0]
  def change
    rename_column :forum_post_replies, :category, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
