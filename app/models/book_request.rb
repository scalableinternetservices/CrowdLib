class BookRequest < ActiveRecord::Base
  belongs_to :lender, :class_name => 'User'
  belongs_to :borrower, :class_name => 'User'
<<<<<<< Updated upstream
  belongs_to :book, :class_name => 'Book'
=======
>>>>>>> Stashed changes
end
