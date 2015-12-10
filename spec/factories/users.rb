

require 'faker'

FactoryGirl.define do
	factory :user do |f|

		fn = Faker::Name.first_name
		ln = Faker::Name.last_name
		un = Faker::Internet.user_name("#{fn} #{ln}")
		em = Faker::Internet.email("#{fn} #{ln}")
		uid = Faker::Number.digit

		f.id uid 
		f.first_name fn
		f.last_name ln
		f.username un
		f.email em
		f.password { Faker::Internet.password }
		f.address { Faker::Address.street_name }
		
	end
end

