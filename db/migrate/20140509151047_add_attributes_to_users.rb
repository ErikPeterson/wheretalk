class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :title, :string
    add_column :users, :degree, :string
    add_column :users, :address, :string
  end
end
