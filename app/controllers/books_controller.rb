#controller for handling all the views for books
require 'set'
require 'base64'
require 'json'
require 'will_paginate/array'

class BooksController < ApplicationController
  before_action :authenticate_user!, :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    books_to_consider=user_signed_in? ? Book.where.not(owner_id: current_user.id) : Book.all
    @books=[]
    books_to_consider.each do |book|
      unless BookTransaction.where("book_id=? AND (approved=false OR requested=false OR returned=false)",book.id).exists?
        @books.push(book)
      end
    end
    @books = @books.where(genre: params[:genre]) if params[:genre].present?
    @books = @books.where(author: params[:author]) if params[:author].present?
    @books = @books.where(title: params[:title]) if params[:title].present?
    @books = @books.paginate(:page => params[:page], :per_page => 15)
    #render :layout => false
    
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @user = current_user
    book_owner = User.where(id: @book.owner_id)
    book_owner = book_owner[0]
    @book_owner_lat = book_owner["lat"]
    @book_owner_lng = book_owner["lng"]
    @book_owner_add = book_owner["address"]
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    if current_user
     @user=current_user
     @book = Book.new(book_params)
     genre=params[:genre].downcase
     
     if Genre.exists?(:name => genre)
        @book.genres << Genre.find_by_name(genre)
     else
        genre = Genre.create(:name => genre)
        @book.genres << genre
     end
     
     @book.owner_id=@user.id
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
    

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   def books_around
    latlng = [ params[:lat], params[:lng] ]
    users = User.within( params[:range], :origin => latlng)
    books = Book.where(owner_id: users)
    modi_books = {}
    array = []
    for user in users
	modi_books = {}
	modi_books["title"] = ''
       for book in books
           #modi_books[
	   if user["id"] == book["owner_id"]
		modi_books["username"] = user["username"]
		modi_books["owner_id"] = book["owner_id"]
		modi_books["id"] = book["id"]
		if modi_books["title"] == ''
			modi_books["title"] += book["title"]
		else
			modi_books["title"] += ", "+book["title"]
		end
		modi_books["lat"] = user["lat"]
		modi_books["lng"] = user["lng"]
	   end
       end
	array.push(modi_books)
    end
    render json: { books:array}
    end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :edition, :genre, :ratings, :image_url, :publisher, :ISBN)
    end
end
