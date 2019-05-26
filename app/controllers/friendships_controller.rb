class FriendshipsController < ApplicationController
    before_action :authenticate_user!

    def index
      @pending = User.pending_friend_requests(current_user)
      @sended = User.sended_pending_friend_requests(current_user)
      @friend_list = User.friend_list(current_user)
    end

    def change

      friendship =  Friendship.change_status(params[:friendship],params[:status])
      
      if friendship.save
        flash[:success] = "Success"
        redirect_to friendships_path
      end

    end

end
