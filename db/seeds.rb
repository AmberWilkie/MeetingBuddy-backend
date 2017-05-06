# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Invite.delete_all
Vote.delete_all
AgendaPoint.delete_all
Meeting.delete_all
User.delete_all

user = User.create(first_name: 'Hack', last_name: 'Persson', email: 'hack@hack.com', password: 'password', password_confirmation: 'password', role: 'Hacker')
user2 = User.create(first_name: 'Lady', last_name: 'Hackity', email: 'hackity@hack.com', password: 'password', password_confirmation: 'password', role: 'CEO')
user3 = User.create(first_name: 'Señor', last_name: 'Hacks-a-lot', email: 'senorhack@hack.com', password: 'password', password_confirmation: 'password', role: 'Design')

meeting1 = Meeting.create(user: user, title: 'Startup Hack!', summary: 'In a tent, all day, hacking.', location: 'Circus Tent', time: Time.now, length: 400)
meeting2 = Meeting.create(user: user, title: 'Beer Yoga', summary: 'Kind of like regular yoga, but with beer', location: 'the other Circus Tent', time: Time.now, length: 30)

agenda_point2 = AgendaPoint.create(body: 'Should we do beer yoga?', time: 1, user:user, meeting: meeting2)
agenda_point1 = AgendaPoint.create(body: 'Jens should pitch the app.', time: 5, user:user, meeting: meeting2)

agenda_point3 = AgendaPoint.create(body: 'Next year, the hack should be underwater.', time: 15, user:user, meeting: meeting1)
agenda_point4 = AgendaPoint.create(body: 'More donuts for the hack.', time: 2, user:user, meeting: meeting1)

invite = Invite.create(meeting: meeting1, user: user)
invite2 = Invite.create(meeting: meeting1, user: user2)
invite3 = Invite.create(meeting: meeting1, user: user3)

invite4 = Invite.create(meeting: meeting2, user: user)
invite5 = Invite.create(meeting: meeting2, user: user2)
invite6 = Invite.create(meeting: meeting2, user: user3)


