class ForumPost < ApplicationRecord
    belongs_to :tenant 
    has_many :forum_post_replies

    def full_tenant_name 
        "#{tenant.first_name} #{tenant.last_name}"
    end
end
