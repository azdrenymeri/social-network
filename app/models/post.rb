class Post < ApplicationRecord
  has_one_attached :picture
  validates :content, presence: true, length:{maximum: 500, minimum: 5}
  validates :user, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes


  

  
end
