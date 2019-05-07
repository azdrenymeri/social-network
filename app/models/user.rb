class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 20 },
             format: { with: /[a-z]+/i }
  validates :last_name, presence: true, length: { maximum: 20 },
             format: { with: /[a-z]+/i }
    validates :DOB , presence:true
    validates :relationship , presence:true
    
    before_save :downcase_email
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence: true,length:{maximum: 255},format: {with:EMAIL_REGEX},
    uniqueness:{case_sensitive: false}
    has_secure_password
    validates :password , presence: true , length: {minimum:6,maximum:50}


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friend_requests_sent, foreign_key: :sender_id,
            class_name: "FriendRequest", dependent: :destroy

  has_many :friend_requests_received, foreign_key: :receiver_id,
            class_name: "FriendRequest", dependent: :destroy

  has_many :friendships, foreign_key: :user1_id, dependent: :destroy
  has_many :friendships_2, class_name: "Friendship", foreign_key: :user2_id,
            dependent: :destroy

  has_many :friends, through: :friendships, source: :user2
end
