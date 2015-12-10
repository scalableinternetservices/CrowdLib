require 'json'
class BookTransactionsController < ApplicationController

	#GET /book_transactions/index
	def index
		@user = current_user
		@book_transaction=BookTransaction.all
		book_txn_with_user = BookTransaction.where("borrower_id=? AND approved=true AND returned=false AND requested=true",@user.id)
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
			if BookTransaction.where("book_id=? AND approved=false AND returned=false AND requested=true", book.id).exists?
				book_txn = BookTransaction.where("book_id=? AND approved=false AND returned=false AND requested=true", book.id)
		      	unless book_txn.nil?
		        	book_wrapper=Hash.new
		        	book_wrapper[:book] = book 
		        	book_wrapper[:book_txn] = book_txn.first
		        	@books_waiting_approval.push(book_wrapper)
		      	end
		    end
	    end
	end

	def request_book
    	@user = current_user
    	@book_transaction=BookTransaction.create(:book_id => params[:book_id], :borrower_id => @user.id, :loan_period => params[:loan_period], :requested => true)
    	@message_to_view="The book was successfully requested for " + @book_transaction.loan_period.to_s + " days!"
    	@book=Book.find(@book_transaction.book_id)
    	render "book_txn_success"
  	end

  	#POST book_transactions/approve
  	def approve_book_request
  		@user = current_user
  		@book_transaction=BookTransaction.find(params[:book_txn_id])
  		if @book_transaction.update(:approved => true)
  			user=User.find(@book_transaction.borrower_id)
  			@book = Book.find(@book_transaction.book_id)
  			@message_to_view="You just approved for " + user.first_name + " " + user.last_name + " borrowing your book."
  			render "book_txn_success"
  		end
  	end

  	#POST book_transactions/reject
  	def reject_book_request
  		@user = current_user
  		@book_transaction=BookTransaction.find(params[:book_txn_id])
  		if @book_transaction.nil?
  			@book = Book.find(@book_transaction.book_id)
  			BookTransaction.delete(params[:book_txn_id])
  			@message_to_view="You just rejected a request from " + user.first_name + " " + user.last_name + " for borrowing your book."
  			render "book_txn_success"
		end
 	end 	
  	


  	#POST book_transactions/return
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