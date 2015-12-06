require 'json'
class BookTransactionsController < ApplicationController

	#GET /book_transactions/index
	def index
		@user = current_user
		@book_transaction=BookTransaction.all
		book_txn_with_user = BookTransaction.where("borrower_id=? AND approved='t' AND borrowed='t'",@user.id).where.not("returned='t'")
		@books_with_user = Array.new
		unless book_txn_with_user.nil?
			book_txn_with_user.each do |book_txn|
				book=Book.find(book_txn.book_id)
				book_wrapper=Hash.new
				book_wrapper[:book] = book 
				book_wrapper[:book_txn] = book_txn
				@books_with_user.push(book_wrapper)
			end
		end
		books_owned_by_user = Book.where(:owner_id => @user.id)
		@books_waiting_approval = Array.new
		books_owned_by_user.each do |book|
			book_txn = BookTransaction.where(:book_id => book.id).where.not("approved='t' OR borrowed='t' OR returned='t'")
	      	unless book_txn.nil?
	        	book_wrapper=Hash.new
	        	book_wrapper[:book] = book 
	        	book_wrapper[:book_txn] = book_txn.first
	        	@books_waiting_approval.push(book_wrapper)
	      	end
	    end
	end

	def request_book
    	@user = current_user
    	@book_transaction=BookTransaction.new(:book_id => params[:book_id], :borrower_id => @user.id, :loan_period => params[:loan_period])
    	@message_to_view="The book was successfully requested for " + @book_transaction.loan_period.to_s + " days!"
    	@book=Book.find(@book_transaction.book_id)
    	render "book_txn_success"
  	end

  	#/booktransaction/return
  	def return_book
  		@user = current_user
  		@book_transaction = BookTransaction.find(params[:book_txn_id])
	    if @book_transaction.update(:returned => true)
	    	@book = Book.find(@book_transaction.book_id)
	    	@message_to_view="The book was successfully returned."
	    	
	    else
	    	@message_to_view = "Sorry this book was already requested"
	    end
	    render "book_txn_success"
	end
end