class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases
    has_many :forum_posts
    has_many :forum_post_replies
    has_many :reservations
    has_many :maintenance_requests
    has_secure_password



    # validates :email_address, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 6}
    validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    

    
    



end
