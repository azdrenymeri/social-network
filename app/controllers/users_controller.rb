class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.people_you_might_know(current_user)
    end

    def edit
        @user=User.find(params[:id])
        
    end

    def update
        @user = User.find(params[:id])
        if params[:user][:picture].nil?
            render "edit"
        else
            @user.picture.purge
            @user.picture.attach(params[:user][:picture])
            redirect_to root_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:id, :picture)
    end
end