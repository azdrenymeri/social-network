class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
      @pending = current_user.pending_friend_requests
      @sended = current_user.sended_pending_friend_requests
      @friendships = current_user.friendships
    end

  def new
    @friendship = Friendship.new
  end
  
  def create
    
    @friendship = Friendship.new(sender:current_user,reciever: User.find(friendship_param[:user_id]),status: 0)

     if @friendship.save
        flash[:success] = "Success"
        redirect_to users_path
     else
        flash[:danger] = "Something went wrong" 
     end
  end

    def update

      @friendship =  Friendship.find(params[:friendship])
      @friendship.status = params[:status].to_i
      
      if @friendship.save
        flash[:success] = "Success"
        redirect_to friendships_path
      end

    end

    def destroy
      fr =  Friendship.destroy(params[:id])

      if fr.destroyed?
        flash[:success] = "Success"
        redirect_to friendships_path
      else
        flash[:dange] = "Something went wrong"
        redirect_to friendships_path
      end
    end


    private
    
    def friendship_param
      params.permit(:user_id)
    end
end
