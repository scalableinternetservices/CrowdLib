class BookRequest < ActiveRecord::Base
  belongs_to :lender, :class_name => 'User'
  belongs_to :borrower, :class_name => 'User'
end
