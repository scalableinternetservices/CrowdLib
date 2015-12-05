require 'set'

class WelcomeController < ApplicationController			
	before_action :authenticate_user!
	
	def index
    	@books = user_signed_in? ? Book.where.not(owner_id: current_user.id) : Book.all
		@books = @books.where(genre: params[:genre]) if params[:genre].present?
    	@books = @books.where(author: params[:author]) if params[:author].present?
    	@books = @books.where(title: params[:title]) if params[:title].present?
    	@books = @books.paginate(:page => params[:page], :per_page => 15)
		@unique_authors = Book.uniq.pluck(:author)
		@unique_genre = Genre.all
	end
end
