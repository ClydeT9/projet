class Photo < ApplicationRecord
    belongs_to :software
    has_many :likes
    
    mount_uploader :image, PhotoUploader

    def is_bookmarked user
        Like.find_by(user_id: user.id, software_id: id)
    end
end
