class Software < ApplicationRecord
    acts_as_votable
    acts_as_commentable
    has_many :software_categories
    has_many :categories, through: :software_categories
    has_many :likes
    has_one_attached :logo
    has_many_attached :images
    belongs_to :user
    self.per_page = 20
    
    
    validates :title, length: {maximum: 25} 
    validates :software_url, length: {maximum: 250} 
    validates :target, length: {maximum: 200} 
    validates :slogan, length: {maximum: 50} 
    validates :editeur, length: {maximum: 45} 
    validates :facebook,length: {maximum: 100} 
    validates :linkedin, length: {maximum: 100} 
    validates :twitter, length: {maximum: 100} 
    
    def thumbnail input
        return self.images[input].variant(resize: '100x100>').processed
    end
    def medium input
        return self.images[input].variant(resize: '300x300>').processed
    end
    def large input
        return self.images[input].variant(resize: '570x305!').processed
    end

    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :finders]
    def slug_candidates
     [
      [:title],
     ]
    end

    def is_liked user
        Like.find_by(user_id: user.id, software_id: id)
    end

    # Pour le draft
    def published?
        published_at?
    end
end
