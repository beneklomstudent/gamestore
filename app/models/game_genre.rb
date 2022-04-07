class GameGenre < ApplicationRecord
    belongs_to :games
    belongs_to :genres
end
