
# http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html

require 'spec_helper'
require 'rails_helper'

describe User do
	it "has a valid factory" do
		expect(create(:user)).to be_valid
	end

	it "is invalid without a first name" do
		user = build(:user, firstname: nil)
		expect(user).not_to be_valid
	end

	it "is invalid without a last name" do
		user = build(:user, lastname: nil)
		expect(user).not_to be_valid
	end	

	it "has a unique UID" do
		user1 = build(:user, username: "username")
		user2 = build(:user, username: "username")
		expect(user2).not_to_be_valid
	end

	it "validates format of email" do
		user = build(:user, email: "hemanth")
		expect(user).not_to_be_valid
	end

	it "validates presence of email" do
		user = build(:user, email: nil)
		expect(user).not_to_be_valid
	end

	it "validates format of password" do
		user = build(:user, password: "hemanth")
		expect(user).not_to_be_valid
	end

	it "validates presence of password" do
		user = build(:user, password: nil)
		expect(user).not_to_be_valid
	end



end
