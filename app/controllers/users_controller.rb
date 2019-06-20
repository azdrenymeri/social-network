class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = current_user.people_you_might_know 
    end

    def edit
        @user = User.find(params[:id])
        
    end

    def update
       
        if  user_params[:name].blank? or 
            user_params[:bio].blank?
            
            flash[:danger] = "There was an error please check your form and re-submit it again"
            render "edit"
        else
            @user = User.find(user_params[:id])
            @user.picture.purge
            @user.picture.attach(user_params[:picture])
            @user.name = user_params[:name]
            @user.bio = user_params[:bio]

            if @user.save
                flash[:success] = "Your profile was set successfuly"
                redirect_to user_path(@user)
            else
                flash[:danger] = "Something went wrong we couldn't update your data"
                render "edit" 
            end
        end
    end

    def show
        @user = User.find(params[:id])
        
    end

    private
    def user_params
        params.require(:user).permit(:id, :name, :bio, :picture)
    end
end