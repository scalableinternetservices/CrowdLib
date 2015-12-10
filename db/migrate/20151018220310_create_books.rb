class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :edition
      t.decimal :ratings
      t.string :image_url
      t.string :publisher
      t.string :ISBN
      t.string :genre
      t.integer :owner_id
      t.timestamps null: false
    end
    add_index(:books, "owner_id")
  end
end
