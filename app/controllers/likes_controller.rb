class LikesController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user, only: :destroy
  
    def create
      @like = Like.new
      @like.user = current_user
      if params[:post_id]
        @like.likeable = Post.find(params[:post_id])
      end
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