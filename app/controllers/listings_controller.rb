class ListingsController < ApplicationController

before_action :set_listing, only: [:update, :edit, :show, :destroy, :delete]   
before_action :authenticate_user!



def set_listing
  @listing = Listing.find(params[:id])  

end

def listing_params
  params.require(:listing).permit(:listingname, :cover, :price, :gamename, :genre)
end 

def index
    @listings = Listing.active
  
end

    def create
      @listing = Listing.new(listing_params)
      @listing.users_id = current_user.id
      begin
        @listing.save!
        redirect_to action: "index"
      end
    end
    
  def new
    @listing = Listing.new
    end

  def update
    @listing.update(listing_params)
    redirect_to @listing
  end

  def edit
    
  end


         
  def show
    @listing = Listing.find(params[:id])
    render :show
  end
  

end
  def destroy
       # Perform the lookup
       @listing = Listing.find(params[:id])
  begin
    @listing.destroy
    redirect_to action: "index"


  end
end

  
