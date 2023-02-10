class FormsController < ApplicationController
  def equipmentQuestion
@equipment=Equipment.find(params[:id])
 end
 def know
@equipment=Equipment.find(params[:id])
end
end
