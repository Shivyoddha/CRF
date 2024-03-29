class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from NameError, with: :handle_name_error
  # rescue_from ActionController::InvalidAuthenticityToken ,with: :render_422
  # rescue_from Net::ReadTimeout, with: :network_error
  # rescue_from Net::OpenTimeout, with: :network_error
  # rescue_from SocketError, with: :network_error
  # rescue_from Errno::ECONNRESET, with: :network_error
  # rescue_from StandardError, with: :render_error
  skip_before_action :verify_authenticity_token



  #
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
    def render_error
    # logger.error(exception) # Log the exception

    # Render an error template with a user-friendly message
    render file: "#{Rails.root}/public/500.html", status: :internal_server_error
  end

  def after_sign_in_path_for(resource)
    stored_location = session[:return_to]
    session.delete(:return_to)
    stored_location || home_index_path
    stored_location_for(resource) || home_index_path
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :store_user_location!, if: :storable_location?
  def record_not_found
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
  def handle_routing_error
    respond_to do |format|
     format.html { render template: 'errors/404', status: :internal_server_error }
     format.json { render json: { error: 'network_error' }, status: :internal_server_error }
   end
     render file: "#{Rails.root}/public/404.html", status: 404

  end
  def handle_name_error

    render file: "#{Rails.root}/public/500.html", status: 500


  end
  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
  # else
  #   head :not_found
  # end
  def render_422
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
  def network_error(exception)
    respond_to do |format|
      format.html { render template: 'errors/505.html.erb', status: :internal_server_error }
      format.json { render json: { error: 'network_error' }, status: :internal_server_error }
    end

  end

  def import_users
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new.call_user(params[:file])

    redirect_to request.referer, notice: 'Import started...'
  end

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
                  :collegeid, :department, :role,:course, :name, :file,:slotbooker,:admin,:faculty_id, :developer]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
