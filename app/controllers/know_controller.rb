class KnowController < ApplicationController
  def xrd
    @equipment=Equipment.find(params[:id])
  end
end
