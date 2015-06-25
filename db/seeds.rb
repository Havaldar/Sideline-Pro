# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.destroy_all
Team.create name: "Baby Blue" 
Team.create name: "Barcalona"
Team.create name: "Real Madrid"
Team.create name: "Bayern Munich"
Team.create name: "Sevilla"
Team.create name: "Bashiktas"
Team.create name: "Galataserai"
Team.create name: "Henrietta Hurricanes"
Team.create name: "Red Wings"
Team.create name: "Rochester Rhinos"
Team.create name: "The Falcons"
Team.create name: "Superman"
Team.create name: "Fruit Loops"
Team.create name: "Meow"

User.destroy_all
User.creat(name: "Kaan", )
