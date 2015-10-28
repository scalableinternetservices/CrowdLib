class User < ActiveRecord::Base
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
end
