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

      t.timestamps null: false
    end
  end
end
