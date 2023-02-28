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
  @bet=Bet.all
end

def lcms
end

def uv
  @uv = UvVisNir.all
end

def laser
end

def cell
  @cell=CellImaging.all
end

def atomic
  @atomic = AtomicForceMicroscope.all
end

def ftnmr
end

def integrated
  @integrated=IntegratedMultiRoleTester.all
end
def scratch
  @scratch=ScratchIndentation.all
end
def threescanner
  @threescan=ThreeDScanner.all
end
def icp
end
def spectro
 @spectro=SpectroRadioMeter.all
end
def spark
  @spark = SparkO.all
end
def fiveaxis
  @five=FiveAxi.all
end
def elctro
  @electro=ElectroChemical.all
end
def gassensing
  @sensing=GasSensing.all
end
def nitrogen
  @nitrogen=LiquidNitrogen.all
end
def centrifuge
  @centrifuge=UltraCentrifuge.all
end
def probe
  @probe=ProbeSonicator.all
end
def glove
  @glove=GloveBox.all
end
def milli
  @milli=MilliQ.all
end
def impdeance
  @impedance_analy=ImpedanceAnaly.all
end
def zeta
  @zeta=ZetaPotentialSize.all
end
def highvaccum
  @high=HighTempVaccum.all
end
end
