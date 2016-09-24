# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Room.create( number: '1001', size: '4', building: 'hunt')
    Room.create( number: '2001', size: '6', building: 'hunt')
    Room.create( number: '3001', size: '8', building: 'hunt')
    Room.create( number: '1011', size: '4', building: 'hill')
    Room.create( number: '2011', size: '6', building: 'hill')
    Room.create( number: '3011', size: '12', building: 'hill')
    
    User.create( name: 'Vivek', email: 'vivek@gmail.com', password: 'a1b2')
    User.create( name: 'Shankar', email: 'shankar@gmail.com', password: 'a2b1')
    User.create( name: 'Prathamesh', email: 'prathamesh@gmail.com', password: 'a3b1')
    
    Reservations.create( booking_date: '2016-09-24', start_time: '17', end_time: '18', status: 'booked')
    Reservations.create( booking_date: '2016-09-24', start_time: '13', end_time: '14', status: 'booked')
    Reservations.create( booking_date: '2016-09-24', start_time: '17', end_time: '18', status: 'released')
    Reservations.create( booking_date: '2016-09-24', start_time: '13', end_time: '14', status: 'booked')
