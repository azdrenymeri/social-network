class LikesController < ApplicationController
  before_action :authenticate_user!
  
    def new
        @like = Like.new
    end

    def create
      @like = Like.new
      @like.user_id = current_user.id
      @like.post_id = Post.find(params[:post_id]).id
      @like.save
      redirect_back(fallback_location: root_path) 
    end
  
    

    def destroy
      @like = Like.find(params[:id])
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
