class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :softwares
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
         validates :name, presence: true, length: {maximum: 75} 

         validates :fullname, presence: true, length: {maximum: 75}

         extend FriendlyId
         friendly_id :name, use: :slugged

         def self.create_from_omniauth(params)
          user = find_or_create_by(email: params.info.email, uid: params.uid)
          user.update({
            token: params.credentials.token,
            name: params.info.name
          })
          user
        end
end