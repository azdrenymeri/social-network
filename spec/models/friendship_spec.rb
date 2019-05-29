require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before do
      @user = User.create!(id:'55',first_name:'John',last_name:"Pip",DOB:'1/1/2011',password:'asd123',email:'a@a.com',relationship:'single')
      @post= Post.create!(title:'cheese',content:'sandwitch',user:@user)
      @user1 = User.create!(id:'56',first_name:'Johnz',last_name:"Pipz",DOB:'1/1/2011',password:'asd123z',email:'aasd@aasd.com',relationship:'single')
      @comment=Comment.create!(content:'this is funny',user:@user,post:@post)
      @comment1=Comment.create!(content:'this is funny',user:@user1,post:@post)
      @like=Like.create!(user:@user,post:@post)
      @friendship= Friendship.create!(user1:@user,user2:@user1)
    end
it "creates friendship" do
 expect(@friendship).not_to eq(nil)
end

it "creates invalid friendship" do
    @friendship.user1=nil
    expect(@friendship).to be_invalid
  end

it "destroys  friendship with user deletion" do
    friendship=Friendship.all.count
  @user.destroy
  expect(friendship).not_to eq(Friendship.all.count)
end



end