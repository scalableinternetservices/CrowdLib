
# http://everydayrails.com/2012/03/19/testing-series-rspec-models-factory-girl.html

require 'spec_helper'
require 'rails_helper'

describe Book do
	it "is invalid without a title " do
		book = build(:book, title: nil)
		expect(book).not_to be_valid
	end

	it "is invalid without an author" do
		book = build(:book, author: nil)
		expect(book).not_to be_valid
	end	

end
