class AddTwoUsersToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :user_one, :integer
    add_column :friends, :user_two, :integer
  end
end
