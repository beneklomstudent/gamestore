class Game < ApplicationRecord
    has_many :game_genres
    has_many :genres, through: :game_genres
    belongs_to :listing

    # has_one :platform
    validates :gamename, presence: { message: "Please provide a name" }
   end

   
   
 