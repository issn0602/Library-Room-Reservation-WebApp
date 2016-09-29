# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


   r1=  Room.create( number: '1001', size: '4 Chairs (Small)', building: 'James B. Hunt Jr. Library')
   r2=   Room.create( number: '2001', size: '6 Chairs (Medium)', building: 'James B. Hunt Jr. Library')
   r3=  Room.create( number: '3001', size: '8 Chairs (Large)', building: 'James B. Hunt Jr. Library')
   r4=  Room.create( number: '1011', size: '4 Chairs (Small)', building: 'D. H. Hill Library')
   r5=  Room.create( number: '2011', size: '6 Chairs (Medium)', building: 'D. H. Hill Library')
   r6= Room.create( number: '3011', size: '8 Chairs (Large)', building: 'D. H. Hill Library')

   u1= User.create( name: 'Vivek', email: 'vivek@gmail.com', password: 'a1b2', role: 'user')
   u2=User.create( name: 'Shankar', email: 'shankar@gmail.com', password: 'a2b1', role: 'admin')
   u3= User.create( name: 'Prathamesh', email: 'prathamesh@gmail.com', password: 'a3b1', role: 'user')
   u4= User.create( name: 'SuperAdmin', email: 'sadmin@gmail.com', password: 'a4b1', role: 'sadmin')

   rs1= Reservation.create( booking_date: '2016-09-28', start_time: '17', end_time: '18', status: 'booked',user_id: u1.id,room_id: r1.id)
   rs2= Reservation.create( booking_date: '2016-09-28', start_time: '1', end_time: '4', status: 'booked',user_id: u1.id,room_id: r2.id)
   rs3= Reservation.create( booking_date: '2016-09-29', start_time: '17', end_time: '18', status: 'booked',user_id: u1.id,room_id: r3.id)
   rs4= Reservation.create( booking_date: '2016-09-29', start_time: '0', end_time: '2', status: 'booked',user_id: u1.id,room_id: r4.id)