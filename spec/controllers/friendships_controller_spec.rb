require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
    before(:each) do 
        @user = FactoryBot.create(:user)
        visit  new_user_session_path
        login (@user)

        @pending = @user.pending_friend_requests
        @sended = @user.sended_pending_friend_requests
        @friend_list = @user.friendships
    end
    it "renders the main friendship index template" do 
        visit friendships_path
        expect(response).to render_template("index")
    end

    private
    def login(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
    end
end
