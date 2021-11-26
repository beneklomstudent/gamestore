class Genre < ApplicationRecord
    has_many :game_genres
    has_many :games, through: :game_genres

    def thegenres
        return "#{genrename}"
    end
end
