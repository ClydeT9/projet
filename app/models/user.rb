class User < ApplicationRecord
  acts_as_voter
  has_one_attached :avatar
  has_many :softwares, dependent: :destroy
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates_length_of :softwares, maximum: 3

        def thumbnail input
          return self.images[input].variant(resize: '100x100>').processed
        end
        def medium input
          return self.images[input].variant(resize: '300x300>').processed
        end

        extend FriendlyId
        friendly_id :name, use: [:slugged, :finders]

        def self.create_from_facebook_data(facebook_data)
          where(provider: facebook_data.provider, uid: facebook_data.uid).first_or_create do | user |
            user.email = facebook_data.info.email
            user.name = facebook_data.info.first_name
            user.fullname = facebook_data.info.last_name
            user.password = Devise.friendly_token[0, 20]
          end
        end

        def self.create_from_google_data(google_data)
          where(provider: google_data.provider, uid: google_data.uid).first_or_create do | user |
            user.email = google_data.info.email
            user.name = google_data.info.first_name
            user.fullname = google_data.info.last_name
            user.password = Devise.friendly_token[0, 20]
        end
      end

end