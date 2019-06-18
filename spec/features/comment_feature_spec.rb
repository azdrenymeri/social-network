require 'rails_helper'

RSpec.feature "CommentCreations", type: :feature do
  
    scenario "creates a comment " do 
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      comment  = FactoryBot.build(:comment)

    visit new_user_session_path
    
    login(user)

    visit post_path(post)
    
    create_comment(comment)

    expect(page).to have_content("Comment created successfuly")
    expect(current_path).to eq(post_path(post))
    end

    private 
    def login(user)
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
    end

    def create_comment(content)
      fill_in "comment_content", with: content
      click_button "Comment"
    end
end
