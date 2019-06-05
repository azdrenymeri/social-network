class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.people_you_might_know(current_user)
        
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:id)
    end
end