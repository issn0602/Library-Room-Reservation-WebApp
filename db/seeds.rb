# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


   r1=  Room.create( number: '1001', size: '4', building: 'hunt')
   r2=   Room.create( number: '2001', size: '6', building: 'hunt')
   r3=  Room.create( number: '3001', size: '8', building: 'hunt')
   r4=  Room.create( number: '1011', size: '4', building: 'hill')
   r5=  Room.create( number: '2011', size: '6', building: 'hill')
   r6= Room.create( number: '3011', size: '12', building: 'hill')

   u1= User.create( name: 'Vivek', email: 'vivek@gmail.com', password: 'a1b2', role: 'user')
   u2=User.create( name: 'Shankar', email: 'shankar@gmail.com', password: 'a2b1', role: 'admin')
   u3= User.create( name: 'Prathamesh', email: 'prathamesh@gmail.com', password: 'a3b1', role: 'user')


    rs1= Reservation.create( booking_date: '2016-09-24', start_time: '17', end_time: '18', status: 'booked',user_id: u1.id,room_id: r1.id)
    rs2= Reservation.create( booking_date: '2016-09-24', start_time: '13', end_time: '14', status: 'booked',user_id: u2.id,room_id: r2.id)
    rs3= Reservation.create( booking_date: '2016-09-24', start_time: '17', end_time: '18', status: 'released',user_id: u1.id,room_id: r3.id)
    rs4= Reservation.create( booking_date: '2016-09-24', start_time: '13', end_time: '14', status: 'booked',user_id: u1.id,room_id: r4.id)
