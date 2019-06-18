require 'rails_helper'

RSpec.feature "PostCreations", type: :feature do

  scenario "user creates a post" do 
    
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit new_user_session_path
    
    login(user)

    

    visit post_path(post)

    expect(current_path).to eq(post_path(post))
    expect(page).to have_content("This is factory content of a post")


  end

  private 
  def login(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

end
