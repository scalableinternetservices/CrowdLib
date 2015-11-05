# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SPAWN USERS


100.times do |x|

	un = Faker::Internet.user_name
	em = Faker::Internet.email
	fn = Faker::Name.first_name
	ln = Faker::Name.last_name
	pw = Faker::Internet.password
	pp = Faker::Avatar.image

	User.create!([{ 

	username: un, 
	email: em, 
	first_name: fn, 
	last_name: ln,
	encrypted_password: pw,
	password: "test1234",
	profile_picture: pp
}
])


end
User.create([{ 
	username: 'mvg', 
	email: 'mvg@cs.ucsb.edu', 
	first_name: 'Miroslav', 
	last_name: 'Gavrilov', 
},
{
    username: 'prithan',
    email: 'prithan@cs.ucsb.edu',
    first_name: 'Pritha',
    last_name: 'DN',
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

