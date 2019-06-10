class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
        @post = Post.new
        @posts = Post.all
        @users= User.all
        @comments=Comment.all
        @likes=Like.all
        @friendships=Friendship.all
    end

    


    private
    def post_params
    params.require(:post).permit(:title,:content)
    end
    
end
