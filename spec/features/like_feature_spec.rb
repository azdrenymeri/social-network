require 'rails_helper'

RSpec.feature "LikeCreations", type: :feature do
 
  
  
  scenario "user likes a post" do 
    
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)

    visit new_user_session_path
    
    login(user)

    visit post_path(post)

    click_link "Like"

    expect(current_path).to eq(post_path(post))
    expect(post.likes.count).to be > 0


  end

  private 
  def login(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

end
