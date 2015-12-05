#controller for handling all the views for books
require 'set'
require 'base64'
require 'json'

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    if user_signed_in?
	@books = Book.where.not(owner_id: current_user.id) if stale?(Book.where.not(owner_id: current_user.id))
    else 
	@books = Book.all if stale?(Book.all)
    end

    @books = @books.where(genre: params[:genre]) if params[:genre].present?
    @books = @books.where(author: params[:author]) if params[:author].present?
    @books = @books.where(title: params[:title]) if params[:title].present?  
    @books = @books.where(owner_id: params[:userid]) if params[:userid].present?
    #@books = @books.paginate(:page => params[:page], :per_page => 15)
    @unique_authors = Book.uniq.pluck(:author)
    @unique_genre = Book.uniq.pluck(:genre)
    render :layout => false
    
  end

  def add_new_comment
    book = Book.find(params[:id])
    comment = Comment.new 
    comment.user_id = current_user.id
    comment.comment = params[:comment]
    comment.commentable_id = book.id
    comment.save!
    redirect_to :action => :show, :id => book
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
    @comments = Comment.where(commentable_id: @book.id)
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

  def create_book_request
    @book = Book.find(params[:id])
    @id=params[:id]
    render "borrow_form"
  end

  def request_book
    id = params[:book_id]
    loan_period=params[:book][:loan_period]
    @book = Book.find(id)
    @message_to_view=""
    if @book.borrower.nil?
      @book.update(:borrower => current_user, :loan_period => loan_period.to_i)
      @message_to_view="The book was successfully requested for "+loan_period.to_s+" days!"
      render "borrow_success"
    else
      @message_to_view="Sorry. The book is already requested by someone else"
      render "borrow_success"
    end
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
