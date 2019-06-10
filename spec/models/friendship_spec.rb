require 'rails_helper'

RSpec.describe Friendship, type: :model do
    before(:all) do
        @friendship = FactoryBot.build(:friendship) 
    end
    it "should be valid with all attributes" do
        expect(@friendship).to be_valid 
    end
    it "should not be valid without a sender" do
        @friendship.sender = nil
        expect(@friendship).not_to be_valid
    end
    it "should not be valid without a reciever either" do 
        @friendship.reciever = nil
        expect(@friendship).not_to be_valid
    end
end