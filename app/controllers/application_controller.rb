class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_index_path
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:firstname, :lastname, :rollno, :orgname, :orgaddress, :contact, :profession,
                  :collegeid, :department, :role,:course, :name, :file]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end





end
