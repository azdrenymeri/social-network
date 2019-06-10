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
        if @user.update(name: params[:name], bio: params[:bio])
            @user.picture.attach(params[:picture])
            redirect_to root_path
            
        else
            render "edit"
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