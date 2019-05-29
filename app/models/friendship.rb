class Friendship < ApplicationRecord
    enum status: [:sended, :accepted, :declined,:blocked]
    
    belongs_to :user1, class_name: "User" , foreign_key: 'user1_id'
    belongs_to :user2, class_name: "User" , foreign_key: 'user2_id'

    validates :user1, presence: true
    validates :user2, presence: true
  
  end