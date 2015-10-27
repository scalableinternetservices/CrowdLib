class WelcomeController < ApplicationController
	def index	
		@unique_authors = Book.uniq.pluck(:author)
	end
end
