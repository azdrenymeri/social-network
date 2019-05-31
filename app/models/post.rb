class Post < ApplicationRecord
  validates :content, presence: true, length:{maximum: 500, minimum: 5}
  validates :title, presence: true, length:{maximum:50, minimum: 3}
  validates :user, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes




  def self.feeds(user)

    friends = User.friend_list(user)
    posts = friends.posts
    posts
  end
  
end
