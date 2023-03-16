class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :render_error
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end

  def after_sign_in_path_for(resource)
    stored_location = session[:return_to]
    session.delete(:return_to)
    stored_location || home_index_path
    stored_location_for(resource) || home_index_path
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :store_user_location!, if: :storable_location?
  private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    session[:return_to] = request.original_url
  end
  # def render_error(exception)
  #    logger.error(exception) # Log the exception
  #
  #    # Render an error template with a user-friendly message
  #    render file: "#{Rails.root}/public/500.html", status: :internal_server_error
  #  end
  protected

  def configure_permitted_parameters
    attributes = [:firstname, :lastname, :rollno, :orgname, :orgaddress, :contact, :profession,
                  :collegeid, :department, :role,:course, :name, :file]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
