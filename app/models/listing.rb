class Listing < ApplicationRecord
    belongs_to :user
    has_many :games, dependent: :destroy  
    has_one_attached :cover, dependent: :purge
    
end
