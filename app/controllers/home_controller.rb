class HomeController < ApplicationController

  def index


    @user=User.find(current_user.id)
    if @user.chairman_role|@user.admin_role == true
    redirect_to admin_portal_admindashboard_path
   else
   end


   # respond_to do |format|
   #       format.html
   #       format.pdf do
   #         render pdf: "ShriRam",
   #                template: "home/index",
   #                formats: [:html],
   #                disposition: :inline,
   #                layout: 'pdf'
   #       end
   #     end


  end
end
