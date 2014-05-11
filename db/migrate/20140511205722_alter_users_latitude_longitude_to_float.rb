class AlterUsersLatitudeLongitudeToFloat < ActiveRecord::Migration
  def up
  	remove_column :users, :latitude
  	remove_column :users, :longitude
  	add_column :users, :longitude, :decimal
  	add_column :users, :latitude, :decimal
  end
end
