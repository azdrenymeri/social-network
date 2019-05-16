class UsersController < ApplicationController
  
  def index
    @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:comments)
  end

  def update
    @user.update_attributes(user_params)
    flash[:success] = "Profile updated."
    redirect_back(fallback_location: @user)
  end

  def destroy
    @user.destroy
    flash[:success] = "Your account has been deleted."
    redirect_to root_path
  end

  private
    def correct_user
      @user = User.find(params[:id])
      unless current_user == @user
        flash[:warning] = "You are not authorized to do that."
        redirect_to root_path
      end
    end

end