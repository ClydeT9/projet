class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :softwares
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :name, presence: true, length: {maximum: 75} 

         validates :fullname, presence: true, length: {maximum: 75}
end