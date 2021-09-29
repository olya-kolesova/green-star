# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying seeds."

Project.destroy_all
Trade.destroy_all
TeamMember.destroy_all
User.destroy_all

puts "Creating users."

user1 = User.create(email: "charles@greenstarrecruitment.co.uk", password: "19091987Charles")
user2 = User.create(email: "milo@greenstarrecruitment.co.uk", password: "1908198Milo")
user3 = User.create(email: "dora@gmail.com", password: "19091987Charles")

puts "Creating Team members."

team_member1 = TeamMember.create(user: user1, first_name: "Charles", last_name: "Swallow", position: "Director", info: "Charles worked for almost 10 years as a consultant in a couple of Cambridge agencies before starting Green Star Recruitment. His passions outside of work include travel to new and intersting locations all over the world and experiencing new cultures and ways of life.")
team_member2 = TeamMember.create(user: user2, first_name: "Milo", last_name: "Cesaro", position: "Trades and Labour Consultant", info: "Milo has a wealth of experience in a number of industries and has recently joined Green Star as a consultant. When he is not checking references, passports and CSCS cards he is mesmerising revellers from behind the decks with a variety of old school garage, techno and drum & bass (strictly vinyl).")
team_member3 = TeamMember.create(user: user3, first_name: "Dora", last_name: "Swallow", position: "Psychologist", info: "Dora's position revolves around keeping the team focused on their targets and ensuring people live to their full potential. When not studying or in session she enjoys chewing cardboard boxes")

def attach_photo(model, file, filename, content)
  model.photo.attach(io: file, filename: filename, content_type: content)
end

file1 = URI.open('https://res.cloudinary.com/green-star/image/upload/v1632933481/Green%20Star/Team_members/Charles_pgz5fi.jpg')
file2 = URI.open('https://res.cloudinary.com/green-star/image/upload/v1632933482/Green%20Star/Team_members/Milo_smmzbf.jpg')
file3 = URI.open('https://res.cloudinary.com/green-star/image/upload/v1632933482/Green%20Star/Team_members/Dora_uh1xd2.jpg')

attach_photo(team_member1, file1, "Charles", "image/jpg")
attach_photo(team_member2, file2, "Milo", "image/jpg")
attach_photo(team_member3, file3, "Dora", "image/jpg")

puts "Creating Projects."

Project.create(name: "AstraZeneca Project Laureate", location: "Cambridge", description: "Cambridge is one of the most exciting bioscience hotspots in the world. It is home to one of AstraZeneca’s three global R&D Centres, alongside Gothenburg and Gaithersburg, and plays a central role in our mission to deliver life-changing medicines to patients." )
Project.create(name: "Battersea Power Station", location: "Battersea, London", description: "Battersea Power Station, which was fully decommissioned in 1983, and given Grade II* building status, is being redeveloped as part of a seven-phased, £8bn ($13.36bn)-worth redevelopment project.")
Project.create(name: "DAMAC Tower", location: "Vauxhall, London", description: "Rising 50 storeys tall, DAMAC Tower Nine Elms is a statuesque addition to London’s South Bank skyline.")
Project.create(name: "Menai Suspension Bridge", location: "Anglesey, Wales", description: "Renovation project on Menai Suspension Bridge. Designed by Thomas Telford and completed in 1826, it was the world's first major suspension bridge.")
Project.create(name: "DP World London Gateway", location: "Stanford-le-Hope", description: "Port within the wider Port of London, United Kingdom. Opened in November 2013, the site is a fully integrated logistics facility, comprising a semi-automated, deep-sea container terminal on the same site as the UK's largest land bank for development of warehousing, distribution facilities and ancillary logistics services.")
Project.create(name: "Cambridge Railway Station", location: "Cambridge", description: "Cambridge railway station is the principal station serving the city of Cambridge in the east of England. Three new tracks were installed at the existing station.")

puts "Creating Trades."

Trade.create(name: "Bricklayers")
Trade.create(name: "Carpenters")
Trade.create(name: "Dry liners")
Trade.create(name: "Electricians")
Trade.create(name: "Duct fitters")
Trade.create(name: "Site managers")
Trade.create(name: "Ground workers")
Trade.create(name: "Labourers")
Trade.create(name: "Plasteres")
Trade.create(name: "Plumbers")
Trade.create(name: "Site supervisors")
Trade.create(name: "Pipe fitters")
Trade.create(name: "Painters and decorators")
Trade.create(name: "Welfare cleaners")
Trade.create(name: "Traffic marshals")
Trade.create(name: "Telescopic forklift operators")
Trade.create(name: "Steel fixers")

puts "Finishing seeding."
