class Listing < ApplicationRecord
    has_many :games
    belongs_to :user
end
