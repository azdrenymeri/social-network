require 'rails_helper'

RSpec.describe Like, type: :model do
    before(:all) do
        @like = FactoryBot.build(:like)
    end

    it "should be valid with all attributes" do
        expect(@like).to be_valid
    end

    it "should not be valid without a user" do 
        like = FactoryBot.build(:like,user:nil)
        expect(like).not_to be_valid
    end

    it "should not be valid without a post" do
        like = FactoryBot.build(:like,post:nil)
        expect(like).not_to be_valid
    end
    
end