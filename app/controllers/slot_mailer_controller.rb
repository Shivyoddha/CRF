class SlotMailerController < ApplicationController
  def xrd
    @xrd=Xrd.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/xrd",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def advance_molecular_rheometer
    @advance_molecular_rheometer=AdvanceMolecularRheometer.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/advance_molecular_rheometer",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def atomic_force_microscope
  end
  def ball_mailing
    @ball_mailing=BallMailing.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/ball_mailing",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def bet
    @bet=Bet.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/bet",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def cell_imaging
    @cell_imaging=CellImaging.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/cell_imaging",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def electro_chemical
    @electro_chemical=ElectroChemical.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/electro_chemical",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def five_axi
    @five_axi=FiveAxi.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/five_axi",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def friction
    @friction=Friction.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/friction",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def ftnmr
    @ftnmr=FtNm.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/ftnmr",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
          end
        end
  end
  def gait
    @gait=Gait.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/gait",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def gas_sensing
    @gas_sensing=GasSensing.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/gas_sensing",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def glove_box
    @glove_box=GloveBox.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/glove_box",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end

  def glow
    @glow=Glow.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/glow",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def grinding
    @grinding=Grinding.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/grinding",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def high_temp_vaccum
    @high_temp_vaccum=HighTempVaccum.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/high_temp_vaccum",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def hr_fesem_c
    @hr_fesem_c=HrFesemC.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/hr_fesem_c",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def hr_fesem_j
    @hr_fesem_j=HrFesemJ.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/hr_fesem_j",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def icp_m
    @icp_m=IcpM.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/icp_m",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def hr_lcm
    @hrlcm=Hrlcm.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/hr_lcm",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def impedance_analyzer
    @impedance_analies=ImpedanceAnaly.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/impedence_analyzer",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def integrated_multi_role_tester
    @integrated_multi_role_tester=IntegratedMultiRoleTester.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/integrated_multi_role_tester",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def ion_chromotography
    @ion_chromotography=IonChromotography.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/ion_chromotography",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def liquid_nitrogen
    @liquid_nitrogen=LiquidNitrogen.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/liquid_nitrogen",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def low_fatigue
    @low_fatigue=LowFatigue.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/low_fatigue",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def laser
    @laser=Laser.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/laser",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def micro_edm
    @micro_edm=MicroEdm.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/micro_edm",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def milli_q
    @milli_q=MilliQ.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/milli_q",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def multi_impact_tester
    @multi_impact_tester=MultiImpactTester.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/multi_impact_tester",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def probe_sonicator
    @probe_sonicator=ProbeSonicator.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/probe_sonicator",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def raman_microscope
    @raman_microscope=RamanMicroscope.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/raman_microscope",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def scratch_indentation
    @scratch_indentation=ScratchIndentation.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/scratch_indentation",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def spark_o
    @spark_o=SparkO.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/spark_o",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def spectro_radio_meter
    @spectro_radio_meter=SpectroRadioMeter.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/spectro_radio_meter",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def tga_fttr
    @tga_fttr=TgaFttr.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/tga_fttr",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def three_d_non_contact
    @three_d_non_contact=ThreeDNonContact.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/three_d_non_contact",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def three_d_scanner
    @three_d_scanner=ThreeDScanner.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/three_d_scanner",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def tribometer
    @tribometer=Tribometer.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/tribometer",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def ultra_centrifuge
    @ultra_centrifuge=UltraCentrifuge.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/ultra_centrifuge",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def uv_vis_nir
    @uv_vis_nir=UvVisNir.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/uv_vis_nir",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  def zeta_potential_size
    @zeta_potential_size=ZetaPotentialSize.find(params[:anish])
    @user=User.find(params[:maithu])
    respond_to do |format|
          format.html
          format.pdf do
            render pdf: "ShriRam",
                   template: "slot_mailer/zeta_potential_size",
                   formats: [:html],
                   disposition: :inline,
                   layout: 'pdf'
                 end
               end
  end
  end
