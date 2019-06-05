class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
      @pending = User.pending_friend_requests(current_user)
      @sended = User.sended_pending_friend_requests(current_user)
      @friend_list = User.friend_list(current_user)
    end

  def new
    @friendship = Friendship.new
  end
  
  def create
    @friendship = Friendship.new
    @friendship.sender = current_user
    @friendship.reciever = User.find(params[:user_id])
    @friendship.status=:pending
    @friendship.save!
    redirect_back(fallback_location: root_path) 
  end

    def change
      friendship =  Friendship.change_status(params[:friendship],params[:status])
      
      if friendship.save
        flash[:success] = "Success"
        redirect_to friendships_path
      end

    end

    def destroy
      
      friendship = Friendship.cancel_friendship(params[:id])

      if friendship.destroy
        flash[:success] = "Success"
      else
        flash[:dange] = "Something went wrong"
      end

      redirect_to friendships_path
    end
end
