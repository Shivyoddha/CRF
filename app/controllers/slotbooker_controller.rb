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
  @hrlcm = Hrlcm.all
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
  @icp_m =IcpM.all
end

def amr
  @advance_molecular_rheometer =AdvanceMolecularRheometer.all
end


def ionc
  @ion_chromotography =IonChromotography.all
end

def trib
  @tribometer =Tribometer.all
end

def glow
  @glow =Glow.all
end

def ball
  @ball_mailing =BallMailing.all
end


def fric
  @friction = Friction.all
end


def gait
  @gait = Gait.all
end

def grind
  @grinding = Grinding.all
end

 def multi
   @multi_impact_tester = MultiImpactTester.all
 end


end
