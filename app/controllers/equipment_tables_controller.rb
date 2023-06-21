class EquipmentTablesController < ApplicationController
  before_action :set_equipment_table, only: %i[ show edit update destroy ]

  # GET /equipment_tables or /equipment_tables.json
  def index
    @equipment_tables = EquipmentTable.all
  end

  # GET /equipment_tables/1 or /equipment_tables/1.json
  def show
  end

  # GET /equipment_tables/new
  def new
    @equipment_table = EquipmentTable.new
  end

  # GET /equipment_tables/1/edit
  def edit
  end

  # POST /equipment_tables or /equipment_tables.json
  def create
    @equipment_table = EquipmentTable.new(equipment_table_params)
    respond_to do |format|
      if @equipment_table.save
        if @equipment_table.role == "student"
        format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully created." }
        format.json { render :show, status: :created, location: @equipment_table }
      else
        format.html { redirect_to payment_paymentExt_path(@equipment_table), notice: "Equipment table was successfully created." }
        format.json { render :show, status: :created, location: @equipment_table }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_tables/1 or /equipment_tables/1.json
  def update
    respond_to do |format|
      if @equipment_table.update(equipment_table_params)
        if @equipment_table.dummy == 'performa_confirmed'
            if @equipment_table.equipname == "XRD"
              PaymentXrdMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Advance Modular Rheometer"
              PaymentAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Atomic Force Microscope"
              PaymentAtomicForceMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Ball Milling Unit"
              PaymentBallMailingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "BET Surface Area Analyzer"
              PaymentBetMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Cell-Imaging MultiMode Reader"
              PaymentCellImagingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Electro Chemical Polishing"
              PaymentElectroChemicalMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "HR-FESEM [Carl Zeiss]"
              PaymentHrFesemCMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "HR-FESEM [Jeol]"
              PaymentHrFesemJMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "5-Axes CNC"
              PaymentFiveAxiMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Friction Stir Welding/Surfacing(FSW)"
              PaymentFrictionMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "GAIT Analysis"
              PaymentGaitMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Gas Sensing"
              PaymentGasSensingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Glove Box"
              PaymentGloveBoxMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Glow"
              PaymentGlowMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Automatic MultiSpecimen Polisher"
              PaymentGrindMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "High Temp Vacuum Furnace"
              PaymentHighTempVaccumMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "ICP-MS"
              PaymentIcpMMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Impedance Analyzer"
              PaymentImpedanceAnalyzerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Intergrated MultiRole Tester"
              PaymentIntegratedMultiRoleTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Ion Chromatography"
              PaymentIonChromotographyMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Laser Flash Analyser"
              PaymentAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "HR-LCMS"
              PaymentHrLcmMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Low Force Fatigue with DMA"
              PaymentLowFatigueMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Milli-Q water"
              PaymentMilliQMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Multi Purpose Impact Testing (SHPB)"
              PaymentMultiImpactTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Liquid Nitrogen"
              PaymentLiquidNitrogenMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Probe Sonicator"
              PaymentProbeSonicatorMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Raman Spectrometer with PL"
              PaymentRamanMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Scratch/Indentation Tester"
              PaymentScratchIndentationMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Spark-OES"
              PaymentSparkOMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Spectro-Radiometer"
              PaymentSpectroRadioMeterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "TGA-FTIR"
              PaymentTgaFttrMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "3-D Non Contact Profilometer"
              PaymentThreeDNonContactMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "3D-Scanner"
              PaymentThreeDScannerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Tribometer"
              PaymentTribometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "UV-Vis-NIR"
              PaymentUvVisNirMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "Zeta Potential/Particle Sizer"
              PaymentZetaPotentialSizeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            FeedbackMailer.with(userid:current_user.id).Mail.deliver_later
      end

      if @equipment_table.dummy == 'payment_completed'
          if @equipment_table.equipname == "XRD"
            SlotbookerXrdMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Advance Modular Rheometer"
            SlotbookerAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Atomic Force Microscope"
           SlotbookerAtomicForceMicroscopMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Ball Milling Unit"
          SlotbookerBallMailingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "BET Surface Area Analyzer"
            SlotbookerBetMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Cell-Imaging MultiMode Reader"
            SlotbookerCellImagingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Electro Chemical Polishing"
            SlotbookerElectroChemicalMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "HR-FESEM [Carl Zeiss]"
            SlotbookerHrFesemCMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "HR-FESEM [Jeol]"
            SlotbookerHrFesemJMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "5-Axes CNC"
            SlotbookerFiveAxiMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Friction Stir Welding/Surfacing(FSW)"
            SlotbookerFrictionMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "GAIT Analysis"
            SlotbookerGaitMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "sesning"
            SlotbookerGasSensingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Glove Box"
            SlotbookerGloveBoxMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Glow"
            SlotbookerGlowMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Automatic MultiSpecimen Polisher"
            SlotbookerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "High Temp Vacuum Furnace"
            SlotbookerHighTempVaccumMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "ICP-MS"
            SlotbookerIcpMMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Impedance Analyzer"
            SlotbookerImpedanceAnalyzerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Intergrated MultiRole Tester"
            SlotbookerIntegratedMultiRoleTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Ion Chromatography"
            SlotbookerIonChromotographyMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Laser Flash Analyser"
            SlotbookerAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "HR-LCMS"
            SlotbookerHrLcmMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Low Force Fatigue with DMA"
            SlotbookerLowFatigueMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Milli-Q water"
            SlotbookerMilliQMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Multi Purpose Impact Testing (SHPB)"
            SlotbookerMultiImpactTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Liquid Nitrogen"
            SlotbookerLiquidNitrogenMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Probe Sonicator"
            SlotbookerProbeSonicatorMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Raman Spectrometer with PL"
            SlotbookerRamanMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Scratch/Indentation Tester"
            SlotbookerScratchIndentatioMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Spark-OES"
            SlotbookerSparkOMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Spectro-Radiometer"
            SlotbookerSpectroRadioMeterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "TGA-FTIR"
           SlotbookerTgaFttrMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "3-D Non Contact Profilometer"
            SlotbookerThreeDNonContactMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "3D-Scanner"
            SlotbookerThreeDScannerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Tribometer"
            SlotbookerTribometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "UV-Vis-NIR"
            SlotbookerUvVisNirMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "Zeta Potential/Particle Sizer"
            SlotbookerZetaPotentialSizeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
    end
        if @equipment_table.role == "student"
          if @equipment_table.dummy == "alloted"
          format.html { redirect_to payment_proforma_confirmation_path(@equipment_table), notice: "Equipment table was successfully updated." }
          format.json { render :show, status: :ok, location: @equipment_table }
          end
          if @equipment_table.dummy == "generated"
          format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully updated." }
          format.json { render :show, status: :ok, location: @equipment_table }
          end
          if @equipment_table.dummy == "performa_confirmed"
          format.html { redirect_to payment_proforma_confirmation_path(@equipment_table), notice: "Equipment table was successfully updated." }
          format.json { render :show, status: :ok, location: @equipment_table }
          end
          if @equipment_table.dummy == "payment_completed"
          format.html { redirect_to payment_payment_completed_path(@equipment_table), notice: "Equipment table was successfully updated." }
          format.json { render :show, status: :ok, location: @equipment_table }
          end
        else
        format.html { redirect_to payment_paymentExt_path(@equipment_table), notice: "Equipment table was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_table }
      end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment_table.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /equipment_tables/1 or /equipment_tables/1.json
  def destroy
    @equipment_table.destroy

    respond_to do |format|
      format.html { redirect_to equipment_tables_url, notice: "Equipment table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_table
      @equipment_table = EquipmentTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_table_params
      params.require(:equipment_table).permit(:username, :equipname, :app_no, :pay, :debit_head, :slotd, :slott, :dummy, :email, :dept, :entry, :reg_no, :course, :guide, :role ,:org,:profesion,:innvoice_name,:invoice_address,:invoice_gst,:amount_paid,:gst_applied,:testing,:consulting,:gst,:state,:date_of_depo,:dd_no, :orgname,:contact_no, :view)
    end
end
