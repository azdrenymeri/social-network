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
      fr =  Friendship.destroy(friendship.id)


      if fr.destroyed?
        flash[:success] = "Success"
      else
        flash[:dange] = "Something went wrong"
      end

      redirect_to friendships_path
    end
end
