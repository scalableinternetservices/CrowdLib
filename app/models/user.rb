class User < ActiveRecord::Base
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :username, uniqueness: true,
			  length: {minimum: 5, maximum: 25}
	validates :email, presence: true,
			  :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
			  	message: "must be a valid email ID"}

	validates :password, presence: true,length: {minimum: 6, maximum: 25},
	          :format => {:with => /\[([a-z]|[A-Z])0-9_-]\z/i, 
	          	message: "must be at least 6 characters and include one number and one letter."}
=======
>>>>>>> Stashed changes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< Updated upstream
        
  has_many :book_requests_as_lender, :class_name => 'BookRequest', :foreign_key => 'lender_id'
  has_many :book_requests_as_borrower, :class_name => 'BookRequest', :foreign_key => 'borrower_id'
  has_many :books, :class_name => 'Book', :foreign_key => 'owner_id'
=======
  has_many :book_requests_as_lender, :class_name => 'BookRequest', :foreign_key => 'lender_id'
  has_many :book_requests_as_borrower, :class_name => 'BookRequest', :foreign_key => 'borrower_id'
  has_many :books, :class_name => 'Book', :foreign_key => 'owner_id'
>>>>>>> trial2
>>>>>>> Stashed changes
end
