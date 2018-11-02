class Software < ApplicationRecord
    has_many :photos
    mount_uploader :logo, LogoUploader
    belongs_to :editor
    
    SOFTWARE_TYPES = ["Marketing", "Finances", "Réseaux Sociaux"]

    validates :title, length: {maximum: 30} 
    validates :software_url, length: {maximum: 50} 
    validates :description, length: {maximum: 400} 
    validates :littledescription,length: {maximum: 60} 
    validates :slogan, length: {maximum: 40} 
    validates :editeur, length: {maximum: 75} 
    validates :facebook,length: {maximum: 150} 
    validates :linkedin, length: {maximum: 150} 
    validates :twitter, length: {maximum: 150} 

    # Pour le draft
    def published?
        published_at?
    end
end
