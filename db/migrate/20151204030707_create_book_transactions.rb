class CreateBookTransactions < ActiveRecord::Migration
  def change
    create_table :book_transactions do |t|
    	t.integer :borrower_id
    	t.integer :book_id
    	t.string :comments
    	t.datetime :return_date
    	t.datetime :borrowed_on
    	t.datetime :returned_on

      t.timestamps null: false
    end
    add_column(:books, :current_transaction_id, :integer)
  end
end
