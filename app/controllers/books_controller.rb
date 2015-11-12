class BooksController < ApplicationController
  before_filter :authenticate_user!

  def create
    render 'create'
  end

  def save_book_data
    safe = { user: current_user, title: params[:title], author: params[:author], image: params[:image], blurb: params[:blurb], isbn: params[:isbn] }
    
    if params.has_key? :id
      book = Book.find params[:id]
      book.update(safe)
      redirect_to :back #:controller => 'book', :action => 'update', :id => params[:id]
    else
      book = Book.new(safe)
      book.save
      redirect_to :controller => 'homepage', :action => 'index'
    end

  end

  def get
    @book = Book.find params[:id]
    render 'index'
  end

  def update
    id = params[:id]
    @book = Book.find id
    render 'update'
  end

  def borrow
    id = params[:id]
    book = Book.find id
    if book.borrower.nil?
      book.update(borrower: current_user)
      render json: "OK"
    else
      render json: "Book already borrowed."
    end
  end
end

