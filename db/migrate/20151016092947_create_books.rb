class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :edition
      t.string :genre
      t.decimal :rating, precision:2, scale: 1
      t.string :publisher
      t.string :image_url

      t.timestamps null: false
    end
  end
end
