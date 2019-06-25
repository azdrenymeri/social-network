class User < ApplicationRecord
  has_one_attached :picture
  has_many :sended_friend_requests, foreign_key: "user1_id",class_name: "Friendship"
  has_many :recieved_friend_requests, foreign_key: "user2_id",class_name: "Friendship"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook]

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :liked_posts, :through => :likes, :source => :post
  has_many :commented_posts,:through => :comments,:source => :post

  validates :name, presence: true,length:{minimum:2,maximum:50}
  validates :bio , presence: true,length:{maximum:100}
  validates :picture, presence:true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.name = 
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.picture = auth.info.image
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end

    else
      super
    end
  end

  # get all pending requests for a user
  def pending_friend_requests
    self.recieved_friend_requests.where(status: Friendship.statuses[:pending])
  end
  
  # get all requests that you have sended to other users
  def sended_pending_friend_requests
    self.sended_friend_requests.where(status: Friendship.statuses[:pending])
  end

  # get friendships
  def friendships
 
    lst = Array.new
    
    sended = self.sended_friend_requests.where(status: Friendship.statuses[:accepted])
    
    sended.each do |request|
     lst << request
    end

    recieved = self.recieved_friend_requests.where(status: Friendship.statuses[:accepted])

    recieved.each do |request|
      lst << request
    end
    
    lst
  end

  def friend_list
 
    lst = Array.new
    
    sended = self.sended_friend_requests.where(status: Friendship.statuses[:accepted])
    
    sended.each do |request|
     lst << request.reciever
    end

    recieved = self.recieved_friend_requests.where(status: Friendship.statuses[:accepted])

    recieved.each do |request|
      lst << request.sender
    end
    
    lst
  end

  def people_you_might_know
    # might_know  = User.where(id: User.friend_list(user).pluck(:id).to_a)
   
    might_know = User.where.not("id = ?",self.id)
    recieved_friend_requests = pending_friend_requests.pluck("user1_id")
    sended_friend_requests  =  sended_pending_friend_requests.pluck("user2_id")
    friends = friend_list

    if recieved_friend_requests.any?
      might_know = might_know.where.not(id:recieved_friend_requests)
    end

    if friends.any?
      might_know = might_know.where.not(id:friends)
    end

    if sended_friend_requests.any?
      might_know = might_know.where.not(id:sended_friend_requests)
    end
    might_know
  end

  def feeds
    
    posts = Array.new
  #  TODO optimize
    friend_list.each do |friend|
     friend.posts.each do |post|
      posts << post
     end
    end
    self.posts.each do |post|
      posts << post
    end

    posts
  end
end
