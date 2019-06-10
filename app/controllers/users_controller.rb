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
        @user = User.find(params[:id])
        @user.update(name: params[:name], bio: params[:bio])
        @user.picture.attach(params[:picture])
        puts "fucking shit"
        puts "fucking shit"
        puts "fucking shit"
        puts "fucking shit"
        puts "fucking shit"
        puts "fucking shit"
        puts @user.picture
        redirect_to root_path
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:id, :picture)
    end
end