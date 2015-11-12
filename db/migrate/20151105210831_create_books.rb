class CreateBooks < ActiveRecord::Migration
  def change
    create_table "books", force: :cascade do |t|
      t.string   "title"
      t.string   "author"
      t.string   "isbn"
      t.text     "blurb"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
