require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
    before(:each) do 
        @user = FactoryBot.create(:user)
        visit "/"
        login (@user)

        @pending = User.pending_friend_requests(@user)
        @sended = User.sended_pending_friend_requests(@user)
        @friend_list = User.friend_list(@user)
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
