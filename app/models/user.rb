class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook]

         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :posts, dependent: :destroy

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.photo = auth.info.image
  
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
end
