class User < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	attr_accessor :name

	has_many :lendings
	has_many :borrowings
end
