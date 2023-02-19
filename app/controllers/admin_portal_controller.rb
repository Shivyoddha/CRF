class AdminPortalController < ApplicationController

  def admindashboard
    @user=User.find(current_user.id)

  if user_signed_in?

    @user=User.find(current_user.id)
   if @user.admin_role?
   else
     redirect_to home_index_path
   end

  else
     redirect_to new_user_session_path

  end


  end
end
