class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
    	t.string :name
    end

    create_table :books_genres, :id => false do |t|
    	t.integer "genre_id"
    	t.integer "book_id"
    end
    add_index :books_genres, ["genre_id","book_id"]
  end
end
