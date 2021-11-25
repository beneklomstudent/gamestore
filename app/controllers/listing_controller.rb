class ListingController < ApplicationController
    def create
     @Listing = listing.new(listing_params)   
     begin
     @listing.save!  
     redirect_to @listing
     end
     
    def listing_params
    params.require(:game)
end
