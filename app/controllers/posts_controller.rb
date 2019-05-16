class PostsController < ApplicationController
    
    def create
      @post = current_user.posts.new(post_params)
      if @post.save
        flash[:success] = "The post has been created."
        redirect_to root_path
      else
        flash.now[:info] = "Something went wrong, try again."
        render 'static_pages#home'
      end
    end
  
    def destroy
      @post.destroy
      flash[:success] = "This post has been deleted."
      redirect_to root_path
    end
  
    private
  
      def post_params
        params.require(:post).permit(:title,:content,:image)
      end
  
      def correct_user
        @post = Post.find(params[:id])
        unless @post.user == current_user
          flash[:warning] = "You are not allowed to delete other people's posts."
          redirect_to root_path
        end
      end
  end