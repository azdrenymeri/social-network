class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @comments = Comment.all
        
    end

    def new
       @comment = Comment.new
    end
    
    def show
        @comment = Comment.find(params[:id])
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back(fallback_location: root_path)
      end

    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
          redirect_back(fallback_location: root_path)
        else
          redirect_back(fallback_location: root_path)
        end
      end

    private
    def comment_params
    params.require(:comment).permit(:content, :post_id)
    end

    
end
