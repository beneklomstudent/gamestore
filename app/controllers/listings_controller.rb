class ListingsController < ApplicationController
# before_action :authenticate_user!, except: [:index, :show]
# before_action :check_auth, except: [:search]
before_action :set_listing, only: [:update, :edit, :show, :destroy]
before_action :authenticate_user!

# def set_listing
#   @listing = Listing.find(params[:id])  
#   authorize @listing
# end

def listing_params
  params.require(:listing).permit(:listingname, :cover, :price, :gamename, :genre)
end 

def index
    @listings = Listing.active
    authorize @listings
  end


  def show
  end 

  def new
    @listing = Listing.new
    authorize @listing

    end


  def edit
    authorize @listing
  end


  def create
    @listing = Listing.new(listing_params)
    @listing.users_id = current_user.id
    authorize @listing
    begin
      @listing.save!
      redirect_to action: "index"
    end
  
  #   respond_to do |format|
  #     if @listing.save
  #       format.html { redirect_to @listing, notice: 'Project was successfully created.' }
  #       format.json { render :show, location: @listing }
  # else
  #   format.html { render :new }
  #   format.json { render json: @listings.errors, status: :unprocessable_entity }
  # end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.

    


    
  def check_auth
    authorize Listing
  end
end
end
