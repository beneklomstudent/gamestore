class ListingsController < ApplicationController

before_action :set_listing, only: [:update, :edit, :show, :destroy]   
before_action :authenticate_user!

def set_listing
  @listing = Listing.find(params[:id])  
  # authorize @listing
end

def listing_params
  params.require(:listing).permit(:listingname, :cover, :price, :gamename, :genre)
end 

def index
    @listings = Listing.active
    # authorize @listings
end
  
    def create
      @listing = Listing.new(listing_params)
      @listing.users_id = current_user.id
      # authorize @listing
      begin
        @listing.save!
        redirect_to action: "index"
      end
    end
    

  def new
    @listing = Listing.new
    # authorize @listing

    end

  def update
    @listing.update(listing_params)
    redirect_to @listing


  def edit
    # authorize @listing
  end


         
  def show
    @listing = Listing.find(params[:id])
    render :show
  end
  

  def destroy   
    @listing = Listing.find(params[:listing_id])
  #   @listing.destroy
  #  redirect to index(@listing)
  end


    
  end



end