class Post < ApplicationRecord
    has_many :games, dependent: :destroy
end
