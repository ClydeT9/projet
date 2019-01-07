class Software < ApplicationRecord
    acts_as_votable
    acts_as_commentable
    is_impressionable
    has_many :software_categories
    has_many :categories, through: :software_categories
    has_many :impressions, :as=>:impressionable
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

    def view_count_yesterday
        impressions.where("created_at >= ? AND created_at < ?",1.day.ago.beginning_of_day, 1.day.ago.end_of_day).size
    end

    def view_count_today
        impressions.where("created_at >= ? AND created_at < ?", Time.now.beginning_of_day, Time.now.end_of_day).size
        # impressionist_count(:start_date => 1.day.ago)
    end
    
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
