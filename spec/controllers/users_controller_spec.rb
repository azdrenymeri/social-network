require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    before(:each) do 
        # @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryBot.create(:user)
        visit  new_user_session_path
        login (@user)
    end
    it "renders index template with users you might know" do 
        visit "/users"
        expect(users_path(@user)).to render_template("index")
    end
    it "renders index template with users you might know" do 
        visit users_path(@user)
        expect(response).to render_template("index")
    end
    it "renders the edit template and the details of the current logged in user" do 
        visit edit_user_path(@user)
        expect(response).to render_template("edit")
    end
    it "rendres the show template of the user" do 
        visit user_path(@user)
        expect(response).to render_template("show")
    end
    private
    def login(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
    end
end
