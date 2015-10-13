# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{ 
	username: 'mvg', 
	email: 'mvg@cs.ucsb.edu', 
	first_name: 'Miroslav', 
	last_name: 'Gavrilov', 
	password: '0744ae48f38d3d899641bdd8de4bdf3234599eb0'
}])
