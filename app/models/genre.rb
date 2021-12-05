class Genre < ApplicationRecord
  belongs_to :listings

    def thegenres
        return "#{genrename}"
    end
end
