# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company_1 = Company.create!(name: "Admin company",
                website: "www.admincompany.com",
                address: "Raleigh, NC",
                year: "1995",
                revenue: "110000",
                synopsis: "Best company in NC")
                
User.create!(name:  "Admin1",
             email: "skeerth@ncsu.edu",
             password:              "skeerth",
             password_confirmation: "skeerth",
             admin: true,
             company: company_1)