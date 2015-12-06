# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SPAWN USERS

rng = Random.new
def create_new_point(rng)
        ns = 34.241943 + (rng.rand)
        we = -119.889999 + (rng.rand)

        { :lat => ns.to_f, :lng => we.to_f }
end
5.times do |x|

	un = Faker::Internet.user_name
	em = Faker::Internet.email
	fn = Faker::Name.first_name
	ln = Faker::Name.last_name
	pw = Faker::Internet.password
	pp = Faker::Avatar.image
	ab = Faker::Lorem.paragraph
	point = create_new_point rng

	u = User.create([{ 

	username: un, 
	email: em, 
	first_name: fn, 
	last_name: ln,
	encrypted_password: pw,
	password: "test1234",
	profile_picture: pp,
	blurb: ab,
	lat: point[:lat], 
	lng: point[:lng]
}
])

end

@users = User.all
@users.each do |x|

	# SPAWN BOOKS

	1.times do |book|

		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		#gn = Faker::Book.genre
		is = Faker::Code.isbn
		img = Faker::Avatar.image

		Book.create([{ 

		image_url: img,
		title: ti, 
		author: au, 
		edition: 1, 
		genre: "Thriller",
		publisher: pb,
		owner_id: x.id,
		ISBN: is
		
	}
	])
	end
	1.times do |book|

		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		#gn = Faker::Book.genre
		is = Faker::Code.isbn
		img = Faker::Avatar.image

		Book.create([{ 

		image_url: img,
		title: ti, 
		author: au, 
		edition: 1, 
		genre: "Romance",
		publisher: pb,
		owner_id: x.id,
		ISBN: is
	}
	])
	end
	1.times do |book|

		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		#gn = Faker::Book.genre
		is = Faker::Code.isbn
		img = Faker::Avatar.image

		Book.create([{ 
		image_url: img,
		title: ti, 
		author: au, 
		edition: 1, 
		genre: "Fiction",
		publisher: pb,
		owner_id: x.id,
		ISBN: is
		
	}
	])
	end
	1.times do |book|

		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		#gn = Faker::Book.genre
		is = Faker::Code.isbn
		img = Faker::Avatar.image

		Book.create([{ 

		image_url: img,
		title: ti, 
		author: au, 
		edition: 1, 
		genre: "Biographies",
		publisher: pb,
		owner_id: x.id,
		ISBN: is
		
	}
	])
	end
	1.times do |book|

		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		#gn = Faker::Book.genre
		is = Faker::Code.isbn
		img = Faker::Avatar.image

		Book.create([{ 

		image_url: img,
		title: ti, 
		author: au, 
		edition: 1, 
		genre: "Children",
		publisher: pb,
		owner_id: x.id,
		ISBN: is
		
	}
	])
	end
	@books = Book.all
		@books.each do |book|
		Comment.create([{
			commentable_id: book.id,
			comment: Faker::Lorem.paragraph,
			user_id: user.id
		}])
	end
end

