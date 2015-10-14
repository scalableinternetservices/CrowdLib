class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :community, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
