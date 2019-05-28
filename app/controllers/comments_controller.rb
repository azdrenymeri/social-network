class CommentsController < ApplicationController


    def index
        @comments = Comment.all
        
    end

    def new
        if current_user
            @comment = Comment.new
        else
            redirect_to login_path 
        end
    end
    
    def show
        @comment = Comment.find(params[:id])
    end

    def create
        @comment = Comment.new
        @comment.content = params[:content]
        @comment.post_id = Post.find(params[:post_id]).id
        @comment.save
        redirect_back(fallback_location: root_path) 
      end

    private
    def comment_params
    params.require(:comment).permit(:content)
    end

    
end
