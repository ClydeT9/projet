class SoftwareCategory < ApplicationRecord
    belongs_to :software
    belongs_to :category
end
