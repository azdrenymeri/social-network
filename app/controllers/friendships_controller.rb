class FriendshipsController < ApplicationController
    before_action :logged_in_user
    before_action :find_friendship, only: [:destroy, :accept]
    before_action :user1, only: :destroy
    before_action :user2, only: :accept
  
    def index
    end
  
    def create
      @friendship = Friendship.new(user1: current_user, user2: @requested,:status : '0')
      @friendship.save
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      @friendship.destroy
      redirect_back(fallback_location: root_path)
    end
  
    def accept
      @friendship.update_attribute(:status, '1')
      redirect_to @friendship.requester
    end
  
    private
      def user1
        unless @friendship.requester == current_user || @friendship.requested == current_user
          flash[:warning] = "You are not authorized."
          redirect_to root_path
        end
      end
  
      
  end