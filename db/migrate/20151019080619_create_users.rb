class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.text :address
      t.decimal :lender_rating
      t.decimal :borrower_rating

      t.timestamps null: false
    end
  end
end
