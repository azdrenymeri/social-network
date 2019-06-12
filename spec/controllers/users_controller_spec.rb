require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    before(:each) do 
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryBot.create(:user)
        visit "/"
        login (@user)
    end
    

    private
    def login(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
    end
end
