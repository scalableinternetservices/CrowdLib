class BooktransactionsController < ApplicationController
	def index
		@user = current_user
		#@book = Book.find(1)
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

		book_txn_waiting_approval = BookTransaction.where("borrower_id=? AND approved='t' AND borrowed='t'",@user.id).where.not("returned='t'")
		@books_waiting_approval = Array.new
		unless book_txn_waiting_approval.nil?
			book_txn_waiting_approval.each do |book_txn|
				book=Book.find(book_txn.book_id)
				@books_waiting_approval.push(book)
			end
		end
	end
	#/booktransaction/return
  def return
    #book_txn = BookTransaction.update(params[:book_txn_id], :returned => true)
    #@book = Book.find(book_txn.book_id)
    #@message_to_view="The book was successfully returned."
    #render "book_txn_success"
    renden json{success:"yes"}
  end
end