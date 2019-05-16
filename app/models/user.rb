class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy

  has_many :friendships, foreign_key: :user1_id, dependent: :destroy
  
  has_many :friendships_2, class_name: "Friendship", foreign_key: :user2_id,
            dependent: :destroy

  has_many :friends, through: :friendships, source: :user2

  validates :first_name, presence: true, length: { maximum: 20 },
             format: { with: /[a-z]+/i }
  
  validates :last_name, presence: true, length: { maximum: 20 },
             format: { with: /[a-z]+/i }
  
  validates :DOB , presence:true
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,presence: true,length:{maximum: 255},format: {with:EMAIL_REGEX},
    uniqueness:{case_sensitive: false}
  
  has_secure_password
  validates :password_digest , presence: true , length: {minimum:6,maximum:150}

  def friends
    requested_friends + requesting_friends
  end

  # Returns true if two users are friends
  def friend?(user)
    friends.include?(user)
  end

  # Full name of user
  def full_name
    "#{first_name} #{last_name}"
  end

  # Returns friendships where status 0
  # 0-pending, 1 - accepted , 2 - declined
  def requests
    friendships.where(status: '0')
  end

  private

    # Email to all lower-case
    def downcase_email
      email.downcase!
    end

end
