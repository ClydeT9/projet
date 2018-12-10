class Software < ApplicationRecord
    acts_as_commentable
    has_many :software_categories
    has_many :categories, through: :software_categories
    has_many :photos
    has_many :likes
    mount_uploader :logo, LogoUploader
    belongs_to :user
    self.per_page = 20
    

    validates :title, length: {maximum: 25,minimum:3} 
    validates :software_url, length: {maximum: 150,minimum:2} 
    validates :target, length: {maximum: 200,minimum:6} 
    validates :description, presence: true
    validates :slogan, length: {maximum: 75,minimum: 15} 
    validates :editeur, length: {maximum: 45} 
    validates :facebook,length: {maximum: 100} 
    validates :linkedin, length: {maximum: 100} 
    validates :twitter, length: {maximum: 100} 

    extend FriendlyId
    friendly_id :title, use: :slugged

    def is_liked user
        Like.find_by(user_id: user.id, software_id: id)
    end

    # Pour le draft
    def published?
        published_at?
    end
end
