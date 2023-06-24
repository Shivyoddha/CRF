class PaymentController < ApplicationController
#   before_action :authenticate_admin!
#
#   def authenticate_admin!
#   if current_user&.admin_role != true && current_user&.chairman_role != true
#       redirect_to home_index_path, alert: "You are not authorized to access this page."
#   end
# end
  def payment
    @equipment = EquipmentTable.all
    @equipment = EquipmentTable.order(updated_at: :desc)

  end
  def paymentC
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentCc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentD
    @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentDc
    @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentExt
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExtC
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def payementExtM
      @equipment = EquipmentTable.new
      @xrd = Xrd.new
  end

  def paymentExtR
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExtU
      @entry = params[:entry]
      @equipment = EquipmentTable.all
  end

  def paymentM
    @advance_molecular_rheometer = AdvanceMolecularRheometer.new
    @atomic_force_microscope = AtomicForceMicroscope.new
    @ball_mailing = BallMailing.new
    @bet = Bet.new
    @cell_imaging = CellImaging.new
    @electro_chemical = ElectroChemical.new
    @five_axi = FiveAxi.new
    @friction = Friction.new
    @ft_nm = FtNm.new
    @gait = Gait.new
    @gas_sensing = GasSensing.new
    @glove_box = GloveBox.new
    @glow = Glow.new
    @grinding = Grinding.new
    @high_temp_vaccum = HighTempVaccum.new
    @hr_fesem_c = HrFesemC.new
    @hr_fesem_j = HrFesemJ.new
    @hrlcm = Hrlcm.new
    @icp_m = IcpM.new
    @impedance_analy = ImpedanceAnaly.new
    @integrated_multi_role_tester = IntegratedMultiRoleTester.new
    @ion_chromotography = IonChromotography.new
    @laser = Laser.new
    @liquid_nitrogen = LiquidNitrogen.new
    @low_fatigue = LowFatigue.new
    @micro_edm = MicroEdm.new
    @milli_q = MilliQ.new
    @multi_impact_tester = MultiImpactTester.new
    @probe_sonicator = ProbeSonicator.new
    @raman_microscope = RamanMicroscope.new
    @scratch_indentation = ScratchIndentation.new
    @spark_o = SparkO.new
    @spectro_radio_meter = SpectroRadioMeter.new
    @tga_fttr = TgaFttr.new
    @three_d_non_contact = ThreeDNonContact.new
    @three_d_scanner = ThreeDScanner.new
    @tribometer = Tribometer.new
    @ultra_centrifuge = UltraCentrifuge.new
    @uv_vis_nir = UvVisNir.new
    @xrd = Xrd.new
    @zeta_potential_size = ZetaPotentialSize.new
    @entry = params[:entry]
    @equipment = EquipmentTable.new
  end

  def paymentP
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentPc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentS
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentSc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentU
      @entry = params[:entry]
      @equipment = EquipmentTable.all
  end

  def paymentA
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def payment_completed
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def proforma_confirmation
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def generate_pdf
  @equipment_table = EquipmentTable.find(params[:id])

  respond_to do |format|
    format.pdf do
      render pdf: "file_name",
             template: "payment/payment_pdf.html.erb",
             layout: "pdf.html",
             show_as_html: params.key?('debug'),
            locals:{ equipment_table: @equipment_table }
    end
  end
end

end
