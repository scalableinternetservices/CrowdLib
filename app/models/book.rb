class Book < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	belongs_to :user

	# There are long book names so using a max of 100 chars 
	# Eg: Proceedings of the Second International Workshop on Nude Mice 
	
	validates  :Title, presence: true, length: { maximum: 100 }
	validates  :Author, presence: true, length: { maximum: 30}

end