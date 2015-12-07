class BookTransaction < ActiveRecord::Base
	belongs_to :borrower, :class_name => "User", :foreign_key => "user_id"
	belongs_to :book
end
