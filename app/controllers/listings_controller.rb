class ListingsController < ApplicationController
# before_action :authenticate_user!, except: [:index, :show]
# before_action :check_auth, except: [:search]
before_action :set_listing, only: [:update, :edit, :show, :destroy]
after_action :verify_authorized, only: [:new, :create, :edit, :destroy]




def index
    @listings = Listing.order(listingname: :asc)
    authorize @listing
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
      redirect_to @index, notice: "Listing was successfully created"
    rescue
      flash.now[:errors] = @listing.errors.messages.values.flatten
      render 'new'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])  
      authorize @listing
    end
  

    def listing_params
        
      params.permit(:listingname, :game_id, :price, genre_id: [])
    end 
    
  def check_auth
    authorize Listing
  end
end
