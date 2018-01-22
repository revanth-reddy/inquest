# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Abhishek Jain",
             email: "cseabhishekjain@gmail.com",
             college: "NIT Durgapur",
             Contact_number: '9836322833',
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@ccanitd.org"
#   college = "NIT Durgapur"
#   contact = "9999999999"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                college: college,
#                Contact_number: contact,
#                password:              password,
#                password_confirmation: password)
# end