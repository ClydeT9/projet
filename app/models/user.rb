class User < ApplicationRecord
  acts_as_voter
  has_one_attached :avatar
  has_many :softwares, dependent: :destroy
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

         def thumbnail input
          return self.images[input].variant(resize: '100x100>').processed
        end
        def medium input
          return self.images[input].variant(resize: '300x300>').processed
        end

         extend FriendlyId
         friendly_id :name, use: [:slugged, :finders]

         def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] &&  session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end
        
        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            user.name = auth.info.first_name
            user.fullname = auth.info.last_name
          end
        end
end