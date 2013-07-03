# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{name: 'Admin'}, {name: 'Customer'}, {name: 'VenueOwner'}])

User.create([{email:'rnarayana@live.com', password:'pinngs7123', password_confirmation:'pinngs7123', role_ids:'1'}])