class GeolocateUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal
    add_column :users, :lng, :decimal
    add_index :users, [ :lat, :lng ]
  end
end
