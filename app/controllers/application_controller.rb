class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from NameError, with: :handle_name_error
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken do
    render plain: 'Invalid Authenticity Token', status: :unprocessable_entity
  end
   rescue_from Net::ReadTimeout, with: :network_error
   rescue_from Net::OpenTimeout, with: :network_error
   rescue_from SocketError, with: :network_error
  rescue_from Errno::ECONNRESET, with: :network_error
  rescue_from StandardError, with: :render_error
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
    def render_error
    # logger.error(exception) # Log the exception
 end

  def after_sign_in_path_for(resource)
    stored_location = session[:return_to]
    session.delete(:return_to)
    stored_location || home_index_path
    stored_location_for(resource) || home_index_path
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :store_user_location!, if: :storable_location?
  # def record_not_found
  #   flash[:error] = "Sorry, we couldn't find that record."
  #
  # end
  def handle_name_error

    render file: "#{Rails.root}/public/500.html", status: 500

end

  private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    session[:return_to] = request.original_url
  end

  protected

  def configure_permitted_parameters
    attributes = [:firstname, :lastname, :rollno, :orgname, :orgaddress, :contact, :profession,
                  :collegeid, :department, :role,:course, :name, :file,:faculty_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
