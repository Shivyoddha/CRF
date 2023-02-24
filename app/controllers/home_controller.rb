class HomeController < ApplicationController

  def index
    @user=User.find(current_user.id)
    if @user.slotbooker == 'xrd'
    redirect_to slotbooker_xrd_path(current_user.id)
  else
     end
   if @user.admin_role == true
    redirect_to rails_admin_path
   else
   end


   respond_to do |format|
         format.html
         format.pdf do
           render pdf: "ShriRam",
                  template: "home/anish",
                  formats: [:html],
                  disposition: :inline,
                  layout: 'pdf'
         end
       end


  end
end
