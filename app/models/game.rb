class Game < ApplicationRecord
    belongs_to :listing
    has_many :game_genres
    has_many :genres, through: :game_genres
   end
   