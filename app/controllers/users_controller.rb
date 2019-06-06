class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.people_you_might_know(current_user)
        @strangers = User.all - User.people_you_might_know(current_user)
        @z=User.all
        puts "fcking shit"
        @users.each do |user| 
            puts user.email
        end
        puts "fcking shit"
        @strangers.each do |user| 
            puts user.email
        end
        puts "fcking shit"
        @z.each do |user| 
            puts user.email
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:id)
    end
end