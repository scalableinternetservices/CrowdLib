require 'faker'

FactoryGirl.define do
	factory :book do |f|

		
		ti = Faker::Book.title
		au = Faker::Name.name
		pb = Faker::Book.publisher
		is = Faker::Code.isbn
		ed = Faker::Number.digit
		ownerid = Faker::Number.digit


		f.title ti 
		f.author au 
		f.edition ed 
		genre "Thriller"
		publisher pb
		owner_id ownerid
		ISBN is
		
		
	end
end

