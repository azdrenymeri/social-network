require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
      @user = User.create!(id:'55',first_name:'John',last_name:"Pip",DOB:'1/1/2011',password:'asd123',email:'a@a.com',relationship:'single')
      @post= Post.create!(title:'cheese',content:'sandwitch',user:@user)
      @user1 = User.create!(id:'56',first_name:'Johnz',last_name:"Pipz",DOB:'1/1/2011',password:'asd123z',email:'aasd@aasd.com',relationship:'single')
      @comment=Comment.create!(content:'this is funny',user:@user,post:@post)
      @comment1=Comment.create!(content:'this is funny',user:@user1,post:@post)
      @like=Like.create!(user:@user,post:@post)
    end
it "creates post" do
 expect(@post).not_to eq(nil)
end

it "creates invalid post" do
    @post.content=''
   expect(@post).to be_invalid
  end

it "destroys post" do
  posts=Post.all.count
  @post.destroy
  expect(posts).not_to eq(Post.all.count)
end

it "destroys dependant likes with post" do
  
  likes = Like.all.count
  @post.destroy
  expect(likes).not_to eq(Like.all.count)
end

it "destroys dependant comments with post" do
  
  comments = Comment.all.count
  @post.destroy
  expect(comments).not_to eq(Comment.all.count)
end

it "destroys dependant post with user" do
  
  posts = Post.all.count
  @user.destroy
  expect(posts).not_to eq(Post.all.count)
end

end
