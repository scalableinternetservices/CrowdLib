class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ratyrate_rater
  acts_as_mappable
  has_many :book_transactions, :foreign_key => "borrower_id"
  has_many :books, :class_name => 'Book', :foreign_key => 'owner_id'

  validates_uniqueness_of :username, { :message => "is already taken!"}
  validates_length_of :username, { within: 5..20, too_long: 'pick a shorter name', too_short: 'pick a longer name' }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
