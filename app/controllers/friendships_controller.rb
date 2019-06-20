class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
      @pending = current_user.pending_friend_requests
      @sended = current_user.sended_pending_friend_requests
      @friendships = current_user.friend_list
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
      @friendship = Friendship.find(params[:friendship])
      @friendship.change_status
      redirect_to friendships_path
    end

    def destroy
      
      @friendship =  Friendship.destroy(params[:id])
      @friendship.destroy
      redirect_to friendships_path
    end


    private
    
    def friendship_param
      params.permit(:user_id)
    end
end
