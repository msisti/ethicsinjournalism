# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    User.create(name: 'Michelle', email: 'msisti@brandeis.edu', password: '12345678', admin: 'true')
    User.create(name: 'Nishan', email: 'acharyan@brandeis.edu', password: '12345678', admin: 'true') 
    User.create(name: 'Ken', email: 'kharsch@brandeis.edu', password: '12345678', admin: 'true') 
    User.create(name: 'student', email: 's@brandeis.edu', password: '12345678', admin: 'false')
    User.create(name: 'example student', email: 'e@brandeis.edu', password: '12345678', admin: 'false')
   