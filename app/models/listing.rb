class Listing < ApplicationRecord
    belongs_to :user, optional: true
    has_one_attached :cover, dependent: :purge
  

    # scope :active, ->{ where(status: "active") }
    # scope :inactive, ->{ where(status: "inactive") }


    # def active?
    #     status == "active"
    #   end
    
    #   def inactive
    #     status == "inactive"
    #   end

    
end

