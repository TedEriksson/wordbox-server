class AddPendingToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :pending, :boolean, :default => true
  end
end
