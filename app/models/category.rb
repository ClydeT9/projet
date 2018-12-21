class Category < ApplicationRecord
    has_many :software_categories
    has_many :softwares, through: :software_categories
    has_ancestry

    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
end