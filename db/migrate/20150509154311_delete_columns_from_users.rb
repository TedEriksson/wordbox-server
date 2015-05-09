class DeleteColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :oauth_id
  	remove_column :users, :name
  	remove_column :users, :nickname
  end
end
