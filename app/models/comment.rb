class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 400,minimum:5 }
  validates :post, presence: true
  validates :user, presence: true
  
  belongs_to :user
  belongs_to :post
end
