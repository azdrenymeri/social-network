class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
        @post = Post.new
        @posts = Post.all
        @users= User.all
        @comments=Comment.all
        @likes=Like.all
    end

    def new
        @post = Post.new
    end

    def create 
        flash[:success] = "Its working fine"
        redirect_to root_path
    end


    private
    def post_params
    params.require(:post).permit(:title,:content)
    end
    
end
