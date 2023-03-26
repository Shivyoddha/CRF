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
        format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully created." }
        format.json { render :show, status: :created, location: @equipment_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_tables/1 or /equipment_tables/1.json
  def update
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
      PaymentCellImagingMailer.with(id:@equipment_table.id, userid:current_user.id).Mail.deliver_later
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
    respond_to do |format|
      if @equipment_table.update(equipment_table_params)
        format.html { redirect_to payment_payment_path(@equipment_table), notice: "Equipment table was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_table }
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
      params.require(:equipment_table).permit(:username, :equipname, :app_no, :pay, :debit_head, :slotd, :slott, :dummy, :email, :dept, :entry, :reg_no, :course, :guide)
    end
end
