require 'faker'

puts "deleting old data.."

Tenant.destroy_all
ForumPost.destroy_all
Lease.destroy_all
ForumPostReply.destroy_all
Reservation.destroy_all


puts "seeding tenants"
tenant1 = Tenant.create(first_name: "Joe", last_name: "Robbins", phone_number: "123-456-7890", email_address: "joe@joe.com", password: "password")
tenant2 = Tenant.create(first_name: "Tim", last_name: "Apple", phone_number: "123-456-7890", email_address: "tim@apple.com", password: "password")
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
apartment2 = Apartment.create(layout: "1 Bedroom", apartment_number: "137-B", occupied: true)
puts "apartments seeded"


puts "seeding leases"
Lease.create(apartment_id: apartment1.id, tenant_id: tenant1.id, move_in_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), pets: false, lease_start: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), lease_end: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), rent: 3560, rent_duedate: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"))
Lease.create(apartment_id: apartment2.id, tenant_id: tenant2.id, move_in_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), pets: true, pet_count: 1, lease_start: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), lease_end: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), rent: 3560, rent_duedate: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"))
puts "leases seeded"


puts "making forum_posts"
15.times do 
    ForumPost.create(tenant_id: rand(Tenant.first.id..Tenant.last.id), text: Faker::GreekPhilosophers.quote, category: Faker::Job.field)
end
puts "done making forum posts"

puts "making forum post replies"
50.times do
    ForumPostReply.create(forum_post_id: rand(ForumPost.first.id..ForumPost.last.id), tenant_id: rand(Tenant.first.id..Tenant.last.id), text: Faker::GreekPhilosophers.quote)
end
puts "done making replies"

puts "seeding reservations"
Reservation.create(tenant_id: 1, ammenity: "Sky Lounge", date_reserved: "December, 25, 2022", description: "Christmas Party", title: "Joe's Holiday Party")

Reservation.create(tenant_id: 2, ammenity: "Pool", date_reserved: "December, 26, 2022", description: "Pool Party for my 2 year old, other kids welcome!", title: "2nd Birthday Party")

Reservation.create(tenant_id: 2, ammenity: "Movie Room", date_reserved: "December, 27, 2022", description: "Watching sunday football, all are welcome", title: "Christmas Day Football Watch Party")

Reservation.create(tenant_id: 1, ammenity: "Sky Lounge", date_reserved: "December, 25, 2022", description: "Christmas Party", title: "Joe's Holiday Party")

Reservation.create(tenant_id: 2, ammenity: "Pool", date_reserved: "December, 26, 2022", description: "Pool Party for my 2 year old, other kids welcome!", title: "2nd Birthday Party")

Reservation.create(tenant_id: 2, ammenity: "Movie Room", date_reserved: "December, 27, 2022", description: "Watching sunday football, all are welcome", title: "Christmas Day Football Watch Party")
puts "done seeding reservations"