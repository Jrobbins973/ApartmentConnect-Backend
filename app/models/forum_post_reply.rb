class ForumPostReply < ApplicationRecord
    belongs_to :tenant 
    belongs_to :forum_post
end
