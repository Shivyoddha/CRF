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
        if @equipment_table.dummy == 'done'
            if @equipment_table.equipname == "xrd"
              PaymentXrdMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "amr"
              PaymentAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "atomic"
              PaymentAtomicForceMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "ball"
              PaymentBallMailingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "bet"
              PaymentBetMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "cell"
              PaymentCellImagingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "electro"
              PaymentElectroChemicalMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "fesemc"
              PaymentHrFesemCMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "fesemj"
              PaymentHrFesemJMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "five"
              PaymentFiveAxiMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "fric"
              PaymentFrictionMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "gait"
              PaymentGaitMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "sesning"
              PaymentGasSensingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "glove"
              PaymentGloveBoxMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "glow"
              PaymentGlowMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "grind"
              PaymentGrindMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "high"
              PaymentHighTempVaccumMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "icp"
              PaymentIcpMMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "imped"
              PaymentImpedanceAnalyzerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "integrated"
              PaymentIntegratedMultiRoleTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "ionc"
              PaymentIonChromotographyMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "laser"
              PaymentAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "lcms"
              PaymentHrLcmMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "low"
              PaymentLowFatigueMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "milli"
              PaymentMilliQMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "multi"
              PaymentMultiImpactTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "nitrigen"
              PaymentLiquidNitrogenMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "probe"
              PaymentProbeSonicatorMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "raman"
              PaymentRamanMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "scratch"
              PaymentScratchIndentationMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "spark"
              PaymentSparkOMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "spectro"
              PaymentSpectroRadioMeterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "tga"
              PaymentTgaFttrMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "threed"
              PaymentThreeDNonContactMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "threes"
              PaymentThreeDScannerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "trib"
              PaymentTribometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "uv"
              PaymentUvVisNirMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            if @equipment_table.equipname == "zeta"
              PaymentZetaPotentialSizeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
            end
            FeedbackMailer.with(userid:current_user.id).Mail.deliver_later
      end

      if @equipment_table.dummy == 'payment_completed'
          if @equipment_table.equipname == "xrd"
            SlotbookerXrd.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "amr"
            SlotbookerAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "atomic"
           SlotbookerAtomicForceMicroscopMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "ball"
          SlotbookerBallMailingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "bet"
            SlotbookerBetMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "cell"
            SlotbookerCellImagingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "electro"
            SlotbookerElectroChemicalMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "fesemc"
            SlotbookerHrFesemCMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "fesemj"
            SlotbookerHrFesemJMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "five"
            SlotbookerFiveAxiMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "fric"
            SlotbookerFrictionMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "gait"
            SlotbookerGaitMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "sesning"
            SlotbookerGasSensingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "glove"
            SlotbookerGloveBoxMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "glow"
            SlotbookerGlowMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "grind"
            SlotbookerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "high"
            SlotbookerHighTempVaccumMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "icp"
            SlotbookerIcpMMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "imped"
            SlotbookerImpedanceAnalyzerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "integrated"
            SlotbookerIntegratedMultiRoleTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "ionc"
            SlotbookerIonChromotographyMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "laser"
            SlotbookerAdvanceMolecularRheometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "lcms"
            SlotbookerHrLcmMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "low"
            SlotbookerLowFatigueMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "milli"
            SlotbookerMilliQMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "multi"
            SlotbookerMultiImpactTesterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "nitrigen"
            SlotbookerLiquidNitrogenMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "probe"
            SlotbookerProbeSonicatorMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "raman"
            SlotbookerRamanMicroscopeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "scratch"
            SlotbookerScratchIndentatioMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "spark"
            SlotbookerSparkOMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "spectro"
            SlotbookerSpectroRadioMeterMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "tga"
           SlotbookerTgaFttrMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "threed"
            SlotbookerThreeDNonContactMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "threes"
            SlotbookerThreeDScannerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "trib"
            SlotbookerTribometerMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "uv"
            SlotbookerUvVisNirMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end
          if @equipment_table.equipname == "zeta"
            SlotbookerZetaPotentialSizeMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
          end

    end
        if @equipment_table.role == "student"
          if @equipment_table.dummy == "generated"
          format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully updated." }
          format.json { render :show, status: :ok, location: @equipment_table }
          end
          if @equipment_table.dummy == "done"
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
