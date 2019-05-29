require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
      @user = User.create!(id:'55',first_name:'John',last_name:"Pip",DOB:'1/1/2011',password:'asd123',email:'a@a.com',relationship:'single')
      @post= Post.create!(title:'cheese',content:'sandwitch',user:@user)
      @user1 = User.create!(id:'56',first_name:'Johnz',last_name:"Pipz",DOB:'1/1/2011',password:'asd123z',email:'aasd@aasd.com',relationship:'single')
      @comment=Comment.create!(content:'this is funny',user:@user,post:@post)
      @comment1=Comment.create!(content:'this is funny',user:@user1,post:@post)
      @like=Like.create!(user:@user,post:@post)
    end
it "creates like" do
  like= Like.create!(user:@user,post:@post)
 expect(like).not_to eq(nil)
end

it "creates invalid like" do
    @like.user=nil
   expect(@like).to be_invalid
  end


it "destroys like with post" do
  likes=Like.all.count
  @post.destroy
  expect(likes).not_to eq(Like.all.count)
end
end