# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SPAWN USERS

User.create([{ 
	username: 'mvg', 
	email: 'mvg@cs.ucsb.edu', 
	first_name: 'Miroslav', 
	last_name: 'Gavrilov', 
	password: '0744ae48f38d3d899641bdd8de4bdf3234599eb0'
},
{
        username: 'prithan',
        email: 'prithan@cs.ucsb.edu',
        first_name: 'Pritha',
        last_name: 'DN',
        password: 'dummy'
}
])


# SPAWN LOCATIONS

def create_new_point(rng)
	ns = 34.241943 + (rng.rand * 10 - 5)
	we = -119.889999 + (rng.rand * 5 - 2.5)

	{ :lat => ns.to_f, :lng => we.to_f }
end

rng = Random.new

3000.times do |i|
	point = create_new_point rng
	Location.create("lat" => point[:lat], "lng" => point[:lng], "name" => "Point num. #{i}")
end

