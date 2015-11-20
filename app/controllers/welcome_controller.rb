require 'set'

class WelcomeController < ApplicationController			
	before_action :authenticate_user!
	
	def index
    	@books = Book.all #where.not(owner_id: current_user.id )
		@genres = Set.new(Book.all.pluck :genre)
		@genres = Set.new([]) if @genres.nil?
		@books = @books.where(genre: params[:genre]) if params[:genre].present?
    	@books = @books.where(author: params[:author]) if params[:author].present?
    	@books = @books.where(title: params[:title]) if params[:title].present?
		@unique_authors = Book.uniq.pluck(:author)
	end
end
