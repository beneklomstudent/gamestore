class ApplicationController < ActionController::Base
        include Pundit
        rescue_from Pundit::NotAuthorizedError, with: :forbidden
        before_action :configure_permitted_parameters, if: :devise_controller?
        
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

