class HomeController < ApplicationController

  def index
    @user=User.find(current_user.id)
    if @user.chairman_role|@user.admin_role == true
    redirect_to rails_admin_path
   else
   end


  end
end
