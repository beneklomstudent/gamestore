class LineItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def line_item_params
    params.require(:line_item).permit(:quantity,:listing_id, :cart_id)
  end


  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  def create
    
        # Find associated product and current cart
    
        chosen_product = Listing.find(params[:id])
        current_cart = @current_cart
        
      
        # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
        if current_cart.listings.include?(chosen_product)
          # Find the line_item with the chosen_product
          @line_item = current_cart.line_items.find_by(:listing_id => chosen_product)
          #add 1 to quantity
          @line_item.quantity += 1
          redirect_to index_path
          
        else
          #creates a LineItem object to carry to the cart, which can then be ordered
          @line_item = LineItem.new
          @line_item.cart = current_cart
          @line_item.listing  = chosen_product
          redirect_to cart_path
        end


        def destroy
            @line_item = LineItem.find(params[:id])
            @line_item.destroy
            redirect_to cart_path(@current_cart)
          end  
          
    #  Save Line Item
        @line_item.save
        # redirect_to cart_path(current_cart)
      end

     
      
      

      
    
    end