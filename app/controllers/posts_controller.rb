class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
         @post = Post.new
        @posts = current_user.feeds
    end

    def new
        @post = Post.new
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def create 
        @post =  current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path
        else
            render "new"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Your post has been deleted."
        redirect_to root_path
      end

    private
    def post_params
    params.require(:post).permit(:content,:date,:picture)
    end

end
