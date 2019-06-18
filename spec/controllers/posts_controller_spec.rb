require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    before(:each) do 
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryBot.create(:user)
        visit  new_user_session_path
        login (@user)
    end

    it "renders index template" do 
        visit "/"
        expect(response).to render_template("index")
    end
 
    it "renders new template" do
        visit new_post_path
        expect(response).to render_template("new")
    end

    it "renders show template" do
        post = FactoryBot.create(:post) 
        visit post_path(post)
        expect(response).to render_template("show")
    end

    private
    def login(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
    end
end
