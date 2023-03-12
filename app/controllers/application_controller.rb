class ApplicationController < ActionController::Base
  after_action :faculty_mail, only: [:create]


  def faculty_mail
    if resource_name == :user && resource.persisted?
      FacultyMailer.with(id:current_user.id).Mail.deliver_later
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
