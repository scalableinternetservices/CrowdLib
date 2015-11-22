class Book < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	mount_uploader :image_url, ImageUrlUploader # Tells rails to use this uploader for this model.
	belongs_to :owner, :class_name => 'User'
	belongs_to :borrower, :class_name => 'User'

	# There are long book names so using a max of 100 chars 
	# Eg: Proceedings of the Second International Workshop on Nude Mice 
	
	validates  :title, presence: true, length: { maximum: 100 }
	validates  :author, presence: true, length: { maximum: 30}
	scope :genre, -> (genre) { where genre: genre }
	scope :author, -> (author) { where("author like ?", "#{author}%")}
	scope :title, -> (title) { where("title like ?", "#{title}%")}
	ratyrate_rateable 'author'
end
