class CreateBookTransactions < ActiveRecord::Migration
  def change
    create_table :book_transactions do |t|
    	t.integer "borrower_id"
    	t.integer "book_id"
      t.integer "loan_period"
    	t.datetime "return_date"
    	t.boolean "returned", :default => 'false'
      t.boolean "approved", :default => 'false'

      t.timestamps null: false
    end
    add_index(:book_transactions, ["borrower_id", "book_id"])
  end
end
