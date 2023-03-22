class MainportalController < ApplicationController
  load_and_authorize_resource :class => false
  def admindashboard
 end
 def adminModelEquip
   @equiplist=Equiplist.all
  end
end
