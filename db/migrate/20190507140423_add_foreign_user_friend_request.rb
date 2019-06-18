class AddForeignUserFriendRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_requests, :sender, :integer
    add_column :friend_requests, :reciever, :integer

  end
end
