class User < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	has_many :lendings
	has_many :borrowings

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :first_name, presence: true, length: { maximum: 30 }
	validates :last_name, presence: true, length: { maximum: 30 }
	validates :username, presence: true
	validates :username, uniqueness: true
end
