require 'rails_helper'

RSpec.feature "FriendshipFeatures", type: :feature do

  scenario "Sending and recieving a friend request" do
    current_user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
     
    Friendship.create(sender:current_user,reciever: another_user,status: 0)

    expect(current_user.sended_friend_requests.count).to  be > 0
    expect(another_user.recieved_friend_requests.count).to be > 0
  end

end
