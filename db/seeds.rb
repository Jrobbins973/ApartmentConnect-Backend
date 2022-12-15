require 'faker'

puts "deleting old data.."

Tenant.destroy_all


puts "seeding tenants"
tenant1 = Tenant.create(first_name: "Joe", last_name: "Robbins", phone_number: "123-456-7890", email_address: "joe@joe.com", password_digest: "1234")
50.times do 
    Tenant.create( 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.cell_phone,
        email_address: Faker::Internet.email,
        password_digest: Faker::Name.last_name
    )
end
puts "complete"

puts "seeding apartments"
apartment1 = Apartment.create(layout: "2 Bedroom", apartment_number: "937-B", occupied: true)
puts "apartments seeded"


puts "seeding leases"
Lease.create(apartment_id: apartment1.id, tenant_id: tenant1.id, move_in_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), pets: true, pet_count: 1, lease_start: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), lease_end: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), rent: 3560, rent_duedate: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"))
puts "leases seeded"


puts "making forum_posts"
50.times do 
    ForumPost.create(tenant_id: rand(Tenant.first.id..Tenant.last.id), text: Faker::GreekPhilosophers.quote, category: Faker::Job.field)
end
puts "done making forum posts"

puts "making forum post replies"
50.times do
    ForumPostReply.create(forum_post_id: rand(ForumPost.first.id..ForumPost.last.id), tenant_id: rand(Tenant.first.id..Tenant.last.id))
end
puts "done making replies"