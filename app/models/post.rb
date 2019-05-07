class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 180, :minimum 5 }
  validates :title, presence: true, length : {maximum:25,minimum: 3}
  validates :user, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
