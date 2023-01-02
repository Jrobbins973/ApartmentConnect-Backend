class ForumPostReply < ApplicationRecord
    belongs_to :tenant 
    belongs_to :forum_post


    def full_name 
        "#{tenant.first_name} #{tenant.last_name}"
    end



end
