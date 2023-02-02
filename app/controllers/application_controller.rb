class ApplicationController < ActionController::Base
   config.relative_url_root = ""
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || home_index_path
  end
end
