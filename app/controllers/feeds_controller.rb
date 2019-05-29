class FeedsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all
        @users= User.all
        @comments=Comment.all
        @likes=Like.all
    end

end
