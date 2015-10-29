class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :book_requests_as_lender, :class_name => 'BookRequest', :foreign_key => 'lender_id'
  has_many :book_requests_as_borrower, :class_name => 'BookRequest', :foreign_key => 'borrower_id'
end
