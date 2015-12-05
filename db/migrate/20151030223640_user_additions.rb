class UserAdditions < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :lat, :decimal
  	add_column :users, :lng, :decimal
  	add_column :users, :address, :string
  	add_column :users, :profile_picture, :string
  	add_column :users, :bio, :text
  end
end
