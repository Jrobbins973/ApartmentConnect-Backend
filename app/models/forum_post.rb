class ForumPost < ApplicationRecord
    belongs_to :tenant 
    has_many :forum_post_replies
end
