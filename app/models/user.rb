class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater
  acts_as_mappable
  has_many :book_requests_as_lender, :class_name => 'BookRequest', :foreign_key => 'lender_id'
  has_many :book_requests_as_borrower, :class_name => 'BookRequest', :foreign_key => 'borrower_id'
  has_many :books, :class_name => 'Book', :foreign_key => 'owner_id'
  has_many :comments, :class_name => 'Comment', :foreign_key => 'user_id'
end
