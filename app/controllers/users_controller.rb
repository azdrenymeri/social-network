class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.people_you_might_know(current_user)
        @strangers = User.all - User.people_you_might_know(current_user)
        @z=User.all
        
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user = Article.find(params[:id])
        @user.update(name: params[:name], bio: params[:bio])
        @user.avatar.attach(params[:avatar])
        redirect_to feeds_path
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:id)
    end
end