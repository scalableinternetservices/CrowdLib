
# http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html

require 'spec_helper'
require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

describe User do
	it "has a valid factory" do
		expect(create(:user)).to be_valid
	end

	it "is invalid without a first name" do
		user = build(:user, first_name: nil)
		expect(user).not_to be_valid
	end

	it "is invalid without a last name" do
		user = build(:user, last_name: nil)
		expect(user).not_to be_valid
	end	

	it "validates format of email" do
		should validate_email_format_of(:email).with_message('is not looking good')
	end

	it "validates presence of email" do
		user = build(:user, email: nil)
		expect(user).not_to be_valid
	end

	it "validates format of password" do
		user = build(:user, password: "hemanth")
		expect(user).not_to be_valid
	end

	it "validates presence of password" do
		user = build(:user, password: nil)
		expect(user).not_to be_valid
	end



end
