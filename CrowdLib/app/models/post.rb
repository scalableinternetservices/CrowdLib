class Post < ActiveRecord::Base
	include ActiveModel::Serializers::JSON
	attr_accessor :title, :body, :created_at

	belongs_to :community
	belongs_to :user

	has_many :comments
end
