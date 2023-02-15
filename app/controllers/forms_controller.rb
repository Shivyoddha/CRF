class FormsController < ApplicationController
 def xrd
@equipment=Equipment.find(params[:id])
end
end
