class Post < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	belongs_to :community
	belongs_to :user

	has_many :comments
end
