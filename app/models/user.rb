class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :softwares
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
         validates :name, presence: true, length: {maximum: 75} 

         validates :fullname, presence: true, length: {maximum: 75}
         
         def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(:email => data["email"]).first
        
          unless user
            password = Devise.friendly_token[0,20]
            user = User.create(name: data["name"], email: data["email"],
              password: password, password_confirmation: password
            )
          end
          user
        end
end