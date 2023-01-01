require 'faker'

puts "deleting old data.."

Tenant.destroy_all
ForumPost.destroy_all
Lease.destroy_all
ForumPostReply.destroy_all
Reservation.destroy_all
Apartment.destroy_all
MaintenanceRequest.destroy_all



event_array = ["A 'left-handed' party where everything is reversed, including decorations, food, and games.",
    'A "time travel" party where guests dress up as characters from different time periods and play games related to that time period.',
    'A "swap" party where guests bring a wrapped object from their house and trade with someone else at the party.',
    'A "pet rock" party where guests bring their most creative or unique pet rock and compete in a series of pet rock-themed games.',
    'A "mystery flavor" party where guests try to guess the flavor of different foods, drinks, and candies that have been dyed unusual colors.',
    'A "silent" party where guests communicate only through writing or nonverbal gestures.',
    'A "dessert first" party where the main course is served as dessert and vice versa.',
    'A "reverse beauty pageant" where guests compete in a series of challenges that test their "ugliness," such as making the funniest faces or wearing the most ridiculous outfits.',
    'A "fancy dress" party where guests dress up in formal attire and act as though they are at a high society event, even if the setting is casual.',
    'A "five senses" party where each room of the house is themed around one of the five senses (sight, sound, smell, taste, touch) and guests must navigate through the house using only that sense.']


forum_post_array = ["I'm moving into a new apartment and I'm wondering what kind of insurance I should get. Renters insurance? Homeowners insurance? Any recommendations?", "I'm moving into a new apartment and I'm trying to figure out the best way to decorate it. Any tips on how to make a small space feel bigger?", "I just moved into a new apartment and I'm having some issues with the air conditioning. It's not working properly and I'm not sure who to contact to fix it. Any advice?", "I'm moving into a new apartment and I'm trying to decide what kind of utilities to set up. Any advice on the best internet and cable providers in the area?", "I'm moving out of my apartment in a few months and I'm trying to figure out the best way to break my lease. Any advice on how to do this without incurring any penalties?", "I just signed a lease for a new apartment and I'm excited to move in, but I'm a little worried about the safety of the area. Can anyone give me some tips on how to stay safe in my new neighborhood?", "I'm having a problem with my neighbors. They're really loud and it's making it hard for me to sleep at night. What should I do?"]

forum_post_category = ["Miscellaneous", "Buying / Selling", "Need Help", "Pets"]


puts "seeding tenants"
tenant1 = Tenant.create(first_name: "Joe", last_name: "Robbins", phone_number: "123-456-7890", email_address: "joe@joe.com", password: "password")
tenant2 = Tenant.create(first_name: "Tim", last_name: "Apple", phone_number: "123-456-7890", email_address: "tim@apple.com", password: "password")
20.times do 
    Tenant.create!( 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.cell_phone,
        email_address: Faker::Internet.email,
        password: "123456"
    )
end
puts "complete"

puts "seeding apartments"
apartment1 = Apartment.create(layout: "2 Bedroom", apartment_number: "937-B", occupied: true)
apartment2 = Apartment.create(layout: "1 Bedroom", apartment_number: "137-B", occupied: true)
puts "apartments seeded"


puts "seeding leases"
Lease.create(apartment_id: apartment1.id, tenant_id: tenant1.id, move_in_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), pets: false, lease_start: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), lease_end: "9/9/2023", rent: "$3,560", rent_duedate: "1/9/2023")

Lease.create(apartment_id: apartment2.id, tenant_id: tenant2.id, move_in_date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), pets: true, pet_count: 1, lease_start: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), lease_end: "6/23/2023",  rent: "$2,670", rent_duedate: "1/23/2023" )
puts "leases seeded"


puts "making forum_posts"
15.times do 
    ForumPost.create(tenant_id: rand(Tenant.first.id..Tenant.last.id), text: forum_post_array.sample, category: forum_post_category.sample)
end
puts "done making forum posts"

puts "making forum post replies"
50.times do
    ForumPostReply.create(forum_post_id: rand(ForumPost.first.id..ForumPost.last.id), tenant_id: rand(Tenant.first.id..Tenant.last.id), text: Faker::GreekPhilosophers.quote)
end
puts "done making replies"

puts "seeding reservations"
Reservation.create!(tenant: tenant1, ammenity: "Sky Lounge", date_reserved: "December, 25, 2022", description: event_array.sample, title: "Joe's Holiday Party")

Reservation.create!(tenant: tenant2, ammenity: "Pool", date_reserved: "December, 26, 2022", description: "Pool Party for my 2 year old, other kids welcome!", title: "2nd Birthday Party")

Reservation.create!(tenant: tenant2, ammenity: "Movie Room", date_reserved: "December, 27, 2022", description: "FOOTBALL BABY", title: "Christmas Day Football Watch Party")

Reservation.create!(tenant: tenant1, ammenity: "Sky Lounge", date_reserved: "December, 28, 2022", description: event_array.sample, title: "Mystery Party")

Reservation.create!(tenant: tenant2, ammenity: "Pool", date_reserved: "December, 29, 2022", description: event_array.sample, title: "Mystery Party")

Reservation.create!(tenant: tenant2, ammenity: "Movie Room", date_reserved: "December, 30, 2022", description: event_array.sample, title: "Mystery Party")
puts "done seeding reservations"


puts "seeding maintenance requests"
MaintenanceRequest.create!(description: "My fridge door isnt closing properly", tenant_id: Tenant.first.id)
puts "done seeding maintenance requests"