class ListingsController < ApplicationController
# before_action :authenticate_user!, except: [:index, :show]
# before_action :check_auth, except: [:search]
before_action :set_listing, only: [:update, :edit, :show, :destroy]
after_action :verify_authorized, only: [:new, :create, :edit, :destroy]


def index
    @listings = Listing.order(listingname: :asc)
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

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Project was successfully created.' }
        format.json { render :show, location: @listing }
  else
    format.html { render :new }
    format.json { render json: @listings.errors, status: :unprocessable_entity }
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])  
      authorize @listing
    end
  

    def listing_params
        
      params.permit(:listingname, :cover, :game_id, :price, genre_id: [])
    end 
    
  def check_auth
    authorize Listing
  end
end
end
end