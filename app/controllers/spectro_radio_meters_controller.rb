class SpectroRadioMetersController < ApplicationController
  before_action :set_spectro_radio_meter, only: %i[ show edit update destroy ]

  # GET /spectro_radio_meters or /spectro_radio_meters.json
  def index
    @spectro_radio_meters = SpectroRadioMeter.all
  end

  # GET /spectro_radio_meters/1 or /spectro_radio_meters/1.json
  def show
  end

  # GET /spectro_radio_meters/new
  def new
    @spectro_radio_meter = SpectroRadioMeter.new
    @spectro_radio_meter.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Spectro-Radiometer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Spectro-Radiometer").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Spectro-Radiometer").pluck(:expressend).first&.strftime("%d/%m/%Y")
  end

  # GET /spectro_radio_meters/1/edit
  def edit
  end

  # POST /spectro_radio_meters or /spectro_radio_meters.json
  def create
    @spectro_radio_meter = SpectroRadioMeter.new(spectro_radio_meter_params)
    @spectro_radio_meter.user=current_user
    @spectro_radio_meter.status="pending"
    @spectro_radio_meter.build_equipment_table
    if(@spectro_radio_meter.entry_type== "manual")
      @spectro_radio_meter.equipment_table.dummy = "proforma_confirmed"
      @spectro_radio_meter.equipment_table.equipname = @spectro_radio_meter.dummy1
      @spectro_radio_meter.equipment_table.pay = @spectro_radio_meter.amount
      @spectro_radio_meter.equipment_table.username = @spectro_radio_meter.dummy2
      @spectro_radio_meter.equipment_table.debit_head = @spectro_radio_meter.debit
      @spectro_radio_meter.equipment_table.role = @spectro_radio_meter.dummy3
      @spectro_radio_meter.dummy2 = nil
      @spectro_radio_meter.dummy3 = nil
    else
    @spectro_radio_meter.equipment_table.dummy = "alloted"
    @spectro_radio_meter.equipment_table.username = @spectro_radio_meter.user.name
    @spectro_radio_meter.equipment_table.equipname = "Spectro-Radiometer"
    @spectro_radio_meter.equipment_table.app_no = @spectro_radio_meter.id
    @spectro_radio_meter.equipment_table.debit_head = @spectro_radio_meter.debit
    @spectro_radio_meter.equipment_table.role = @spectro_radio_meter.user.role
    @spectro_radio_meter.equipment_table.email = @spectro_radio_meter.user.email
    @spectro_radio_meter.equipment_table.dept = @spectro_radio_meter.user.department
    @spectro_radio_meter.equipment_table.profesion = @spectro_radio_meter.user.profession
    @spectro_radio_meter.equipment_table.orgname = @spectro_radio_meter.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Spectro-Radiometer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @spectro_radio_meter.save
        if  @spectro_radio_meter.expresssample.present?
         equiplist = Equiplist.where(name: "Spectro-Radiometer").first
         equiplist.expressslot =equiplist.expressslot- @spectro_radio_meter.expresssample
         equiplist.save
        end
        if @spectro_radio_meter.user.role=='student'||@spectro_radio_meter.user.role=='faculty'
          SpectroRadioMeterMailer.with(id:@spectro_radio_meter.id, userid:current_user.id).InternalMail.deliver_later
        else
          SpectroRadioMeterMailer.with(id:@spectro_radio_meter.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @spectro_radio_meter.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "spectro_radio_meter was successfully created." }
          format.json { render :show, status: :created, location: @spectro_radio_meter }
      else
        format.html { redirect_to home_index_path, notice: "Spectro radio meter was successfully created." }
        format.json { render :show, status: :created, location: @spectro_radio_meter }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spectro_radio_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spectro_radio_meters/1 or /spectro_radio_meters/1.json
  def update
    @spectro_radio_meter.status="alloted"
    @spectro_radio_meter.build_equipment_table

    respond_to do |format|
      if @spectro_radio_meter.update(spectro_radio_meter_params)
          if @spectro_radio_meter.status!= 'completed'
            SpectroRadioMeterAllotedMailer.with(id:@spectro_radio_meter.id, userid:current_user.id).Mail.deliver_later
          end
        format.html { redirect_to slotbooker_spectro_path(@spectro_radio_meter), notice: "Spectro radio meter was successfully updated." }
        format.json { render :show, status: :ok, location: @spectro_radio_meter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spectro_radio_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spectro_radio_meters/1 or /spectro_radio_meters/1.json
  def destroy
    @spectro_radio_meter.destroy

    respond_to do |format|
      format.html { redirect_to spectro_radio_meters_url, notice: "Spectro radio meter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spectro_radio_meter
      @spectro_radio_meter = SpectroRadioMeter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spectro_radio_meter_params
      params.require(:spectro_radio_meter).permit(:sample, :nature, :application, :stype, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname], references: [])
    end
end
