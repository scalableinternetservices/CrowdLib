class Book < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	validates :title, presence: true, length: { maximum: 80 }
	validates :author, presence: true, length: { maximum: 40 }
	validates :publisher, presence: true, length: { maximum: 80 }

end
