class ListingsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_listing, only: [:update, :edit, :show, :destroy]

def index
    @listings = Listing.order(listingname: :asc)
  end


  def show
  end 

  def new
    @listing = Listing.new

    end


  def edit
  end


  def create
    @listing = Listing.new(listing_params)
    # @listing.user_id = current_user.id
    begin
      @listing.save!
      redirect_to @index
    rescue
      flash.now[:errors] = @listing.errors.messages.values.flatten
      render 'new'
    end
  end
#     respond_to do |format|
#         if @listing.save
#             format.html { redirect to @listing, notice: "listing was successfully created"}
#             format.json { render :show, status: :created, location @listing }
#         else 
#             format.html { render :new }
#             format.json { render json: @listing.errors, status :unprocessable_entity}
#         end 
#     end
# end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
  

    def listing_params
        
      params.permit(:listingname, :game_id, :price, genre_id: [])
    end 
end
