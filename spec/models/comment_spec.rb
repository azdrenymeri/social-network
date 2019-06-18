require 'rails_helper'

RSpec.describe Comment, type: :model do
    before(:all) do
        @comment = FactoryBot.build(:comment)
    end

    it "is valid with valid attributes" do 
        expect(@comment).to be_valid
    end

    it "is not valid without user_id" do
        comment = FactoryBot.build(:comment,user:nil)
        expect(comment).not_to be_valid
    end

    it "is not valid without post_id" do 
        comment = FactoryBot.build(:comment,post:nil)
        expect(comment).not_to be_valid
    end

    it "content should not be valid with more than 400 chars" do 
        comment = FactoryBot.build(:comment,content: (0...401).map { ('a'..'z').to_a[rand(26)] }.join)
        expect(comment).not_to be_valid
    end
end
