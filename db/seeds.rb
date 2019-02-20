# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Job.destroy_all
User.destroy_all
puts "I'm creating some users"
user1 = User.create!(first_name: "Yaniv", last_name: "Matalon", email:"yaniv@gamil.com", password:"123456", phone_number:"0523659870")
user2 = User.create!(first_name: "Liad", last_name: "Peiscic", email:"liad@gamil.com", password:"987654", phone_number:"0528703659")
user3 = User.create!(first_name: "Orianne", last_name: "Gilaad", email:"ori@gamil.com", password:"567890", phone_number:"0523876063")

puts "I'm creating some jobs"
job1 = Job.create!(description: "Bring me a beer", user_id: user1.id, time: 10, cost: 10.00, location: "Burning Man")

job3 = Job.create!(description: "Find the location of the showers", user_id: user3.id, time: 30, cost: 5.50, location: "Ozora")

job2 = Job.create!(description: "Stand in the line of the toilet for me", user_id: user2.id, time: 5, cost: 7.50, location: "Tomorrowland")
job4 = Job.create!(description: "Bring me Dim-Sam", user_id: user2.id, time: 2, cost: 2.50, location: "Boom")
job5 = Job.create!(description: "Bring me a Dealer", user_id: user2.id, time: 2, cost: 20, location: "Boom")
job6 = Job.create!(description: "Bring me a beer", user_id: user2.id, time: 2, cost: 2.50, location: "Ozora")
job7 = Job.create!(description: "Fill my bottle with water", user_id: user2.id, time: 2, cost: 3.00, location: "Burning Man")
job8 = Job.create!(description: "Bring me a beer", user_id: user1.id, time: 10, cost: 10.00, location: "Burning Man")
job9 = Job.create!(description: "Find the location of the showers", user_id: user3.id, time: 30, cost: 5.50, location: "Ozora")
job10 = Job.create!(description: "Stand in the line of the toilet for me", user_id: user2.id, time: 5, cost: 7.50, location: "Tomorrowland")
job11 = Job.create!(description: "Bring me Dim-Sam", user_id: user2.id, time: 2, cost: 2.50, location: "Boom")
job12 = Job.create!(description: "Bring me a Dealer", user_id: user2.id, time: 2, cost: 20, location: "Boom")
job13 = Job.create!(description: "Bring me a beer", user_id: user2.id, time: 2, cost: 2.50, location: "Ozora")
job14 = Job.create!(description: "Fill my bottle with water", user_id: user2.id, time: 2, cost: 3.00, location: "Tomorrowland")





puts "I'm creating some booking"
booking1 = Booking.create!( user_id: user1.id, job_id: job1.id)
booking3 = Booking.create!(user_id: user3.id, job_id: job3.id)

booking2 = Booking.create!(user_id: user2.id, job_id: job2.id)
booking4 = Booking.create!( user_id: user2.id, job_id: job4.id)
booking5 = Booking.create!( user_id: user2.id, job_id: job5.id)
booking6 = Booking.create!( user_id: user2.id, job_id: job6.id)
booking7 = Booking.create!( user_id: user2.id, job_id: job7.id)
