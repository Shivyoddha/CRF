class AdminConstraint
  def matches?(request)
    return false unless request.session[:user_id] # Assuming you store the user ID in the session
    user = User.find(request.session[:user_id])
    user.admin_role?
  end
end
