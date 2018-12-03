class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :softwares
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
         validates :name, presence: true, length: {maximum: 75} 


         def self.from_omniauth(auth)
          user = User.where(email: auth.info.email).first
          
          if user
            return user
          else
            where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
              u.fullname = auth.info.name
              u.provider = auth.provider
              u.uid = auth.uid
              u.email = auth.info.email
              u.image = auth.info.image
              u.password = Devise.friendly_token[0,20]
            end
          end
        end
end