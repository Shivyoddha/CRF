class SlotbookerController < ApplicationController


def xrd
  @xrd=Xrd.all
 end


def xrd1
@xrd=Xrd.all

end

def xrd2
 @xrd2=Xrd.all
end

def xrd3
 @xrd3=Xrd.all
end

def xrd4
 @xrd4=Xrd.all
end

def fesemc
  @fesemc = HrFesemC.all
end


def fesemc1
  @fesemc=HrFesemC.all
  
  end
  
  def fesemc2
   @fesemc=HrFesemC.all
  end
  
  def fesemc3
   @fesemc=HrFesemC.all
  end
  
  def fesemc4
   @fesemc=HrFesemC.all
  end
  
def fesemj
 @fesemj=HrFesemJ.all
end

def threednon
  @three= ThreeDNonContact.all
end

def raman
  @raman = RamanMicroscope.all
end

def tga
  @tga = TgaFttr.all
end

def bet
end

def lcms
end

def uv
  @uv = UvVisNir.all
end

def laser
end

def cell
end

def atomic
  @atomic = AtomicForceMicroscope.all
end

def ftnmr
end

def icp
end



end
