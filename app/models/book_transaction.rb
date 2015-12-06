class BookTransaction < ActiveRecord::Base

	belongs_to :borrower, :class_name => "User", :foreign_key => "borrower_id"
	belongs_to :book, :class_name => "Book", :foreign_key => "book_id"
end
