class SlotbookerController < ApplicationController
load_and_authorize_resource :class => false

def xrd
  @xrd=Xrd.all

 end

def xrd1
@xrd=Xrd.all
EquipmentTable.new


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
  @fesemc1=HrFesemC.all

  end

  def fesemc2
   @fesemc2=HrFesemC.all
  end

  def fesemc3
   @fesemc3=HrFesemC.all
  end

  def fesemc4
   @fesemc4=HrFesemC.all
  end

def fesemj
 @fesemj=HrFesemJ.all
end
    def fesemj1
      @fesemj1=HrFesemJ.all
    end
    def fesemj2
      @fesemj2=HrFesemJ.all
    end
    def fesemj3
      @fesemj3=HrFesemJ.all
    end
    def fesemj4
      @fesemj4=HrFesemJ.all
    end

def threednon
  @three= ThreeDNonContact.all
end
   def threednon1
     @three1=ThreeDNonContact.all
   end
   def threednon2
     @three2=ThreeDNonContact.all
   end
   def threednon3
     @three3=ThreeDNonContact.all
   end
   def threednon4
     @three4=ThreeDNonContact.all
   end

def raman
  @raman = RamanMicroscope.all
end
   def raman1
     @raman1 =RamanMicroscope.all
   end
   def raman2
     @raman2 =RamanMicroscope.all
   end
   def raman3
     @raman3 =RamanMicroscope.all
   end
   def raman4
     @raman4 =RamanMicroscope.all
   end

def tga
  @tga = TgaFttr.all
end
    def tga1
      @tga1 =TgaFttr.all
    end
    def tga2
      @tga2 =TgaFttr.all
    end
    def tga3
      @tga3 =TgaFttr.all
    end
    def tga4
      @tga4 =TgaFttr.all
    end
def bet
  @bet=Bet.all
end
    def bet1
      @bet1=Bet.all
    end
    def bet2
      @bet2=Bet.all
    end
    def bet3
      @bet3=Bet.all
    end
    def bet4
      @bet4=Bet.all
    end

def lcms
  @lcms = Hrlcm.all
end
   def lcms1
     @lcms1=Hrlcm.all
  end
  def lcms2
    @lcms2=Hrlcm.all
  end
  def lcms3
    @lcms3=Hrlcm.all
  end
  def lcms4
    @lcms4=Hrlcm.all
  end

def uv
  @uv = UvVisNir.all
end
   def uv1
   @uv1= UvVisNir.all
   end
   def uv2
   @uv2= UvVisNir.all
   end
   def uv3
   @uv3= UvVisNir.all
   end
   def uv4
   @uv4= UvVisNir.all
   end

def cell
  @cell=CellImaging.all
end
   def cell1
    @cell1=CellImaging.all
   end
   def cell2
    @cell2=CellImaging.all
   end
   def cell3
    @cell3=CellImaging.all
   end
   def cell4
    @cell4=CellImaging.all
   end

def atomic
  @atomic = AtomicForceMicroscope.all
end
   def atomic1
       @atomic1 = AtomicForceMicroscope.all
   end
   def atomic2
       @atomic2 = AtomicForceMicroscope.all
   end
   def atomic3
       @atomic3 = AtomicForceMicroscope.all
   end
   def atomic4
       @atomic4 = AtomicForceMicroscope.all
   end


def integrated
  @integrated=IntegratedMultiRoleTester.all
end
   def integrated1
     @integrated1=IntegratedMultiRoleTester.all
   end
   def integrated2
     @integrated2=IntegratedMultiRoleTester.all
   end
   def integrated3
     @integrated3=IntegratedMultiRoleTester.all
   end
   def integrated4
     @integrated4=IntegratedMultiRoleTester.all
   end
def scratch
  @scratch=ScratchIndentation.all
end
    def scratch1
      @scratch1=ScratchIndentation.all
    end
    def scratch2
      @scratch2=ScratchIndentation.all
    end
    def scratch3
      @scratch3=ScratchIndentation.all
    end
    def scratch4
      @scratch4=ScratchIndentation.all
    end
def threescanner
  @threescan=ThreeDScanner.all
end
      def threescanner1
        @threescan1=ThreeDScanner.all
      end
      def threescanner2
        @threescan2=ThreeDScanner.all
      end
      def threescanner3
        @threescan3=ThreeDScanner.all
      end
      def threescanner4
        @threescan4=ThreeDScanner.all
      end
def icp
  @icp =IcpM.all
end
      def icp1
        @icp1 =IcpM.all
      end
      def icp2
        @icp2 =IcpM.all
      end
      def icp3
        @icp3 =IcpM.all
      end
      def icp4
        @icp4=IcpM.all
      end

def amr
  @amr =AdvanceMolecularRheometer.all
end
      def amr1
        @amr1 =AdvanceMolecularRheometer.all
      end
      def amr2
        @amr2 =AdvanceMolecularRheometer.all
      end
      def amr3
        @amr3 =AdvanceMolecularRheometer.all
      end
      def amr4
        @amr4 =AdvanceMolecularRheometer.all
      end


def ionc
  @ionc =IonChromotography.all
end
      def ionc1
        @ionc1 =IonChromotography.all
      end
      def ionc2
        @ionc2 =IonChromotography.all
      end
      def ionc3
        @ionc3 =IonChromotography.all
      end
      def ionc4
        @ionc4 =IonChromotography.all
      end
def spectro
 @spectro=SpectroRadioMeter.all
end
      def spectro1
       @spectro1=SpectroRadioMeter.all
      end
      def spectro2
       @spectro2=SpectroRadioMeter.all
      end
      def spectro3
       @spectro3=SpectroRadioMeter.all
      end
      def spectro4
       @spectro4=SpectroRadioMeter.all
      end
def spark
  @spark = SparkO.all
end
      def spark1
        @spark1 = SparkO.all
      end
      def spark2
        @spark2 = SparkO.all
      end
      def spark3
        @spark3 = SparkO.all
      end
      def spark4
        @spark4 = SparkO.all
      end
def fiveaxis
  @fiveaxis=FiveAxi.all
end
      def fiveaxis1
        @fiveaxis1=FiveAxi.all
      end
      def fiveaxis2
        @fiveaxis2=FiveAxi.all
      end
      def fiveaxis3
        @fiveaxis3=FiveAxi.all
      end
      def fiveaxis4
        @fiveaxis4=FiveAxi.all
      end
def elctro
  @elctro=ElectroChemical.all
end
      def elctro1
        @elctro1=ElectroChemical.all
      end
      def elctro2
        @elctro2=ElectroChemical.all
      end
      def elctro3
        @elctro3=ElectroChemical.all
      end
      def elctro4
        @elctro4=ElectroChemical.all
      end
def gassensing
  @sensing=GasSensing.all
end
      def gassensing1
        @sensing1=GasSensing.all
      end
      def gassensing2
        @sensing2=GasSensing.all
      end
      def gassensing3
        @sensing3=GasSensing.all
      end
      def gassensing4
        @sensing4=GasSensing.all
      end

def nitrogen
  @nitrogen=LiquidNitrogen.all
end
      def nitrogen1
        @nitrogen1=LiquidNitrogen.all
      end
      def nitrogen2
        @nitrogen2=LiquidNitrogen.all
      end
      def nitrogen3
        @nitrogen3=LiquidNitrogen.all
      end
      def nitrogen4
        @nitrogen4=LiquidNitrogen.all
      end

def centrifuge
  @centrifuge=UltraCentrifuge.all
end
      def centrifuge1
        @centrifuge1=UltraCentrifuge.all
      end
      def centrifuge2
        @centrifuge2=UltraCentrifuge.all
      end
      def centrifuge3
        @centrifuge3=UltraCentrifuge.all
      end
      def centrifuge4
        @centrifuge4=UltraCentrifuge.all
      end
def probe
  @probe=ProbeSonicator.all
end
      def probe1
        @probe1=ProbeSonicator.all
      end
      def probe2
        @probe2=ProbeSonicator.all
      end
      def probe3
        @probe3=ProbeSonicator.all
      end
      def probe4
        @probe4=ProbeSonicator.all
      end
def glove
  @glove=GloveBox.all
end
      def glove1
        @glove1=GloveBox.all
      end
      def glove2
        @glove2=GloveBox.all
      end
      def glove3
        @glove3=GloveBox.all
      end
      def glove4
        @glove4=GloveBox.all
      end

def milli
  @milli=MilliQ.all
end
      def milli1
        @milli1=MilliQ.all
      end
      def milli2
        @milli2=MilliQ.all
      end
      def milli3
        @milli3=MilliQ.all
      end
      def milli4
        @milli4=MilliQ.all
      end

def impdeance
  @imped=ImpedanceAnaly.all
end
      def impdeance1
        @imped1=ImpedanceAnaly.all
      end
      def impdeance2
        @imped2=ImpedanceAnaly.all
      end
      def impdeance3
        @imped3=ImpedanceAnaly.all
      end
      def impdeance4
        @imped4=ImpedanceAnaly.all
      end
def zeta
  @zeta=ZetaPotentialSize.all
end
      def zeta1
        @zeta1=ZetaPotentialSize.all
      end
      def zeta2
        @zeta2=ZetaPotentialSize.all
      end
      def zeta3
        @zeta3=ZetaPotentialSize.all
      end
      def zeta4
        @zeta4=ZetaPotentialSize.all
      end
def highvaccum
  @high=HighTempVaccum.all
end
      def highvaccum1
        @high1=HighTempVaccum.all
      end
      def highvaccum2
        @high2=HighTempVaccum.all
      end
      def highvaccum3
        @high3=HighTempVaccum.all
      end
      def highvaccum4
        @high4=HighTempVaccum.all
      end

def trib
  @trib =Tribometer.all
end
      def trib1
        @trib1 =Tribometer.all
      end
      def trib2
        @trib2 =Tribometer.all
      end
      def trib3
        @trib3 =Tribometer.all
      end
      def trib4
        @trib4 =Tribometer.all
      end


def glow
  @glow =Glow.all
end
      def glow1
        @glow1 =Glow.all
      end
      def glow2
        @glow2 =Glow.all
      end
      def glow3
        @glow3 =Glow.all
      end
      def glow4
        @glow4 =Glow.all
      end

def ball
  @ball =BallMailing.all
end
      def ball1
        @ball1 =BallMailing.all
      end
      def ball2
        @ball2 =BallMailing.all
      end
      def ball3
        @ball3 =BallMailing.all
      end
      def ball4
        @ball4 =BallMailing.all
      end

def fric
  @fric = Friction.all
end
    def fric1
      @fric1 = Friction.all
    end
    def fric2
      @fric2 = Friction.all
    end
    def fric3
      @fric3 = Friction.all
    end
    def fric4
      @fric4 = Friction.all
    end

def gait
  @gait = Gait.all
end
    def gait1
      @gait1 = Gait.all
    end
    def gait2
      @gait2 = Gait.all
    end
    def gait3
      @gait3 = Gait.all
    end
    def gait4
      @gait4 = Gait.all
    end

def grind
  @grind = Grinding.all
end
    def grind1
      @grind1 = Grinding.all
    end
    def grind2
      @grind2 = Grinding.all
    end
    def grind3
      @grind3 = Grinding.all
    end
    def grind4
      @grind4 = Grinding.all
    end

 def multi
   @multi = MultiImpactTester.all
 end

     def multi1
       @multi1 = MultiImpactTester.all
     end
     def multi2
       @multi2 = MultiImpactTester.all
     end
     def multi3
       @multi3 = MultiImpactTester.all
     end
     def multi4
       @multi4 = MultiImpactTester.all
     end

 def laser
   @laser=Laser.all
 end
        def laser1
        @laser1=Laser.all
        end
        def laser2
        @laser2=Laser.all
        end
        def laser3
        @laser3=Laser.all
        end
        def laser4
        @laser4=Laser.all
        end



        def ftnmr
          @ft=FtNm.all
        end
        def ftnmr1
          @ft1=FtNm.all
        end
        def ftnmr2
          @ft2=FtNm.all
        end
        def ftnmr3
          @ft3=FtNm.all
        end
        def ftnmr4
          @ft4=FtNm.all
        end

 def low
   @low = LowFatigue.all
 end
 def low1
   @low1 = LowFatigue.all
 end
 def low2
   @low2 = LowFatigue.all
 end
 def low3
   @low3 = LowFatigue.all
 end
 def low4
   @low4 = LowFatigue.all
 end

end
