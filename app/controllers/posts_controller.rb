class PostsController < ApplicationController


    def index
        @posts = Post.all
        
    end

    def new
        if current_user
            @post = Post.new
        else
            redirect_to login_path 
        end
    end
    
    def show
        @post = Post.find(params[:id])
    end

    def create
        if current_user
            
        @post =  current_user.posts.build(post_params)
            if @post.save
                redirect_to post_path(@post)
            else
                render "new"
            end
        else
            redirect_to login_path
        end

    end

    private
    def post_params
    params.require(:post).permit(:title,:content,:date)
    end

end
