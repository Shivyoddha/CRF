class ApplicationController < ActionController::Base


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

  protected

  def configure_permitted_parameters
    attributes = [:firstname, :lastname, :rollno, :orgname, :orgaddress, :contact, :profession,
                  :collegeid, :department, :role,:course, :name, :file,:faculty_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
