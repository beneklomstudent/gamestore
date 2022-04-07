class Listing < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :cover, dependent: :purge
    has_many :line_items, dependent: :destroy

    scope :active, ->{ where(status: "active") }
    scope :inactive, ->{ where(status: "inactive") }

    validates :gamename, presence: { message: "Please provide a game name" }
    validates :cover, presence: { message: "please provide a cover"}
    validates :price, presence: { message: "please provide a price"}
    validates :listingname, presence: { message: "please provide a listing name"}
    validates :genre, presence: { message: "Please provide a name" }
    
    def active?
        status == "active"
      end
    
      def inactive
        status == "inactive"
      end

    
end

