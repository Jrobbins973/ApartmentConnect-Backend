class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases
    has_many :forum_posts
    has_many :forum_post_replies
    has_many :reservations
    has_secure_password



    # validates :email_address, presence: true, uniqueness: true
    # validates :password_digest, presence: true, length: {minimum: 6}
    
    
    



end
