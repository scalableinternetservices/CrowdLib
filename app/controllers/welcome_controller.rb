class WelcomeController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@unique_authors = Book.uniq.pluck(:author)
	end
end
