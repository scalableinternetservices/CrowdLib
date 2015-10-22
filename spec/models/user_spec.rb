
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

end
