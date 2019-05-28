class CommentsController < ApplicationController
    before_action :logged_in_user

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

    def destroy
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
