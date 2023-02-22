class SlotbookerController < ApplicationController
def xrd
  @xrd=Xrd.all
 end


 def xrd1
   @xrd=Xrd.where(status='pending')
  end

  def xrd2
    @xrd=Xrd.where(status='assigned')
   end

   def xrd3
     @xrd=Xrd.where(status='completed')
    end

def fesemc
 end

def fesemj
  @fesemj=HrFesemJ.all
end

def threednon
end

def raman
end

def tga
end

def bet
end

def lcms
end

def uv
end

def laser
end

def cell
end

def atomic
end

def ftnmr
end

def icp
end
end
