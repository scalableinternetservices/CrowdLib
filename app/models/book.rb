class Book < ActiveRecord::Base
	include ActiveModel::Serializers::JSON

	mount_uploader :image_url, ImageUrlUploader # Tells rails to use this uploader for this model.
	belongs_to :owner, :class_name => 'User'
	has_and_belongs_to_many :genres
	has_many :book_transactions
	has_many :borrowers, :through => :book_transactions


	# There are long book names so using a max of 100 chars 
	# Eg: Proceedings of the Second International Workshop on Nude Mice 
	
	validates  :title, presence: true, length: { maximum: 100 }
	validates  :author, presence: true, length: { maximum: 30}
	ratyrate_rateable 'author'

	scope :latest_books, lambda { order(":created_at ASC")}
	scope :search, lambda{ |args|
		where('title LIKE :query OR author LIKE :query', query:"%#{args}%")
	}

	def is_borrowed
		if self.book_transactions.where("borrowed AND returned",true,false).first
			return true
		else
			return false
		end
	end

	def is_with
		trans = self.book_transactions.where("borrowed=? AND returned=?",true,false).first
		if trans
			return trans.borrower
		else
			return self.owner
		end
	end

end
