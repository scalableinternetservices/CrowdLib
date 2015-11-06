class CreateBookRequests < ActiveRecord::Migration
  def change
    create_table :book_requests do |t|
      t.integer :book_id
      t.integer :lender_id
      t.integer :borrower_id
      t.integer :loan_period
      t.boolean :approved
      t.timestamps null: false
    end
  end
end
