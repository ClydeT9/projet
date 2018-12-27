class User < ApplicationRecord
  acts_as_voter
  has_one_attached :avatar
  has_many :softwares, dependent: :destroy
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

         def thumbnail input
          return self.images[input].variant(resize: '100x100>').processed
        end
        def medium input
          return self.images[input].variant(resize: '300x300>').processed
        end

         extend FriendlyId
         friendly_id :name, use: [:slugged, :finders]

         def self.create_from_provider_data(provider_data)
          where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
            user.email = provider_data.info.email
            user.name = provider_data.info.first_name
            user.fullname = provider_data.info.last_name
            user.password = Devise.friendly_token[0, 20]
          end
        end
end