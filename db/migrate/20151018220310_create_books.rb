class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :edition
      t.string :genre
      t.decimal :ratings
      t.string :image_url
      t.string :publisher
      t.string :ISBN
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :loan_period
      t.timestamps null: false
    end
  end
end
