class Game < ApplicationRecord
    has_many :game_genres
    has_many :genres, through: :game_genres
    belongs_to :post
    has_one :platform
   end
   