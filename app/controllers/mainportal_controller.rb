class MainportalController < ApplicationController
  load_and_authorize_resource :class => false
  # before_action :authenticate_admin!

  def admindashboard

 end
 def adminModelEquip
   @equiplist=Equiplist.all
  end

  def authenticate_admin!
    unless current_user&.admin_role?
      redirect_to home_index_path, alert: "You are not authorized to access this page."
    end
  end

  def adminModelEquipWeeks
    Equiplist.where(week_1: nil).update_all(week_1: 'active')
    Equiplist.where(week_2: nil).update_all(week_2: 'active')
    Equiplist.where(week_3: nil).update_all(week_3: 'active')
    Equiplist.where(week_4: nil).update_all(week_4: 'active')
    Equiplist.where(week_5: nil).update_all(week_5: 'active')
    @equiplist=Equiplist.all
   end
end
