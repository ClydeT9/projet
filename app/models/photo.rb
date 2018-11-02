class Photo < ApplicationRecord
    belongs_to :software
  
    mount_uploader :image, PhotoUploader
end
