require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
      @user = User.create!(id:'55',first_name:'John',last_name:"Pip",DOB:'1/1/2011',password:'asd123',email:'a@a.com',relationship:'single')
      @post= Post.create!(title:'cheese',content:'sandwitch',user:@user)
      @user1 = User.create!(id:'56',first_name:'Johnz',last_name:"Pipz",DOB:'1/1/2011',password:'asd123z',email:'aasd@aasd.com',relationship:'single')
      @comment=Comment.create!(content:'this is funny',user:@user,post:@post)
      @comment1=Comment.create!(content:'this is funny',user:@user1,post:@post)
      @like=Like.create!(user:@user,post:@post)
    end
it "creates comment" do
 expect(@comment).not_to eq(nil)
end
it "creates invalid comment" do
    @comment.content=''
   expect(@comment).to be_invalid
  end
it "destroys comment with post" do
  comments=Comment.all.count
  @post.destroy
  expect(comments).not_to eq(Post.all.count)
end
it "destroys comment with user" do
  comments = Comment.all.count
  @user.destroy
  expect(comments).not_to eq(Comment.all.count)
end

end
