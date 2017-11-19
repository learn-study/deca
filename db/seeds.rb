# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(loginid:"admin", password:"pass")
Faker::Config.locale = 'ja'
2100.times do
     m=Member.new(
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        city: Faker::Address.street_name,
        tel: Faker::PhoneNumber.cell_phone,
        streetaddress: Faker::Address.street_address,
        birthday:Faker::Date.forward(23).strftime('%Y-%m-%d'),
        gender: rand(1..2),
        postal: Faker::Address.postcode.truncate(7)
      )
     #p m
     m.save
end