require 'rails_helper'

RSpec.describe Post, type: :model do
    before(:all) do
        @post = FactoryBot.build(:post)
    end
    
    it "is valid with valid attributes" do
        expect(@post).to be_valid
    end

    it "is not valid without content" do 
        post = FactoryBot.build(:post,content:nil)
        expect(post).not_to be_valid
    end

    it "is not valid without user_id" do 
        post = FactoryBot.build(:post,user:nil)
        expect(post).not_to be_valid
    end
end
