
require 'faker'

FactoryGirl.define do
	factory :user do |f|
		fn = Faker::Name.first_name
		ln = Faker::Name.last_name
		un = Faker::Internet.user_name("#{fn} #{ln}")
		em = Faker::Internet.email("#{fn} #{ln}")

		f.firstname fn
		f.lastname ln
		f.username un
		f.email em
		f.password { Faker::Internet.password }
		f.address { Faker::Address.street_name }
		f.lender_rating 0
		f.borrower_rating 0
	end
end
