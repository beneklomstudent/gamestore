class ApplicationController < ActionController::Base
        include Pundit
        before_action :current_cart
        rescue_from Pundit::NotAuthorizedError, with: :forbidden
        before_action :configure_permitted_parameters, if: :devise_controller?
        protect_from_forgery with: :exception
        
      
    def forbidden
        flash[:alert] = "You are not authorised to perform that action!"
        redirect_to(request.referrer || root_path)
    end

    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
  end
end


private
def current_cart
  if session[:cart_id]
    cart = Cart.find_by(:id => session[:cart_id])
    if cart.present?
      @current_cart = cart
    else
      session[:cart_id] = nil
    end
  end

  if session[:cart_id] == nil
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
end
