class Genre < ActiveRecord::Base

	validates_uniqueness_of(:name)
	has_and_belongs_to_many :books
	has_and_belongs_to_many :users

	scope :find_books, lambda { |args| 
		Book.joins(:genres).where("genres.name" => "#{args}")
	}

	scope :find_users, lambda { |args| 
		User.joins(:genres).where("genres.name" => "#{args}")
	}

end
