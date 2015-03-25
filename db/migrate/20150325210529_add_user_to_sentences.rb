class AddUserToSentences < ActiveRecord::Migration
  def change
    add_reference :sentences, :user, index: true
    add_foreign_key :sentences, :users
  end
end
