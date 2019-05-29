class LikesController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user, only: :destroy
  
    def new
        if current_user
            @like = Like.new
        else
            redirect_to login_path 
        end
    end

    def create
      @like = Like.new
      @like.user_id = current_user.id
      @like.post_id = Post.find(params[:post_id]).id
      @like.save
      redirect_back(fallback_location: root_path) 
    end
  
    def destroy
      @like.destroy
      redirect_back(fallback_location: root_path) 
    end
  
    private
  

     def correct_user
        @like = Like.find(params[:id])
        unless current_user == @like.user
          flash[:warning] = "You are not authorized."
          redirect_back(fallback_location: root_path)
        end
      end
end
