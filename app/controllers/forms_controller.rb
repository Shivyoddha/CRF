class FormsController < ApplicationController
  def equipmentQuestion
@equipment=Equipment.find(params[:id])
 end
 def xrd
@equipment=Equipment.find(params[:id])
end
def records
end
end
