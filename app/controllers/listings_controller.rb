class ListingsController < ApplicationController

before_action :set_listing, only: [:update, :edit, :show, :destroy, :delete]   
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
    end

  def update
    @listing.update(listing_params)
    redirect_to @listing
  end

  def edit
    # authorize @listing
  end


         
  def show
    @listing = Listing.find(params[:id])
    render :show
  end
  

  # def delete
  #   @listing = Listing.find(params[:id])
  #   render 'delete'
  # end

  def destroy
       # Perform the lookup
       @listing = Listing.find(params[:id])
  begin
    @post.delete
  end
end

  # def destroy
  #   @post = Post.find(params[:id])
  #  begin
  #   @post.destroy
  #     end
   
  #   end

end