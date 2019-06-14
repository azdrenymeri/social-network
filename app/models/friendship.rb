class Friendship < ApplicationRecord
    
    enum status: [:pending, :accepted, :cancelled,:blocked]
    
    belongs_to :sender, class_name: "User" , foreign_key: 'user1_id'
    belongs_to :reciever, class_name: "User" , foreign_key: 'user2_id'

    validates :sender, presence: true
    validates :reciever, presence: true

    # this method will change the status of friendships 
    # pending(when adding creating a new frienship) 
    # accepted
    # cancelled
    # blocked
    def self.change_status(id,status)
      friendship = Friendship.find(id.to_i)
      friendship.status = status.to_i
      friendship
    end

    def self.cancel_friendship(current_user_id,id)
     
      friendship = Friendship.where("user1_id = ? AND user2_id = ?",current_user_id,id)
      .or(where("user1_id= ? AND user2_id = ?",id,current_user_id))
    
      return friendship
    end


  end