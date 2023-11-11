class GasSensingsController < ApplicationController
  before_action :set_gas_sensing, only: %i[ show edit update destroy ]

  # GET /gas_sensings or /gas_sensings.json
  def index
    @gas_sensings = GasSensing.all
  end

  # GET /gas_sensings/1 or /gas_sensings/1.json
  def show
  end

  # GET /gas_sensings/new
  def new
    @gas_sensing = GasSensing.new
    @gas_sensing.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Gas Sensing").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Gas Sensing").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Gas Sensing").pluck(:expressend).first&.strftime("%d/%m/%Y")


  end

  # GET /gas_sensings/1/edit
  def edit
  end

  # POST /gas_sensings or /gas_sensings.json
  def create
    @gas_sensing = GasSensing.new(gas_sensing_params)
    @gas_sensing.user=current_user
    @gas_sensing.status="pending"
    @gas_sensing.build_equipment_table
    if(@gas_sensing.entry_type== "manual")
      @gas_sensing.equipment_table.dummy = "proforma_confirmed"
      @gas_sensing.equipment_table.equipname = @gas_sensing.dummy1
      @gas_sensing.equipment_table.pay = @gas_sensing.amount
      @gas_sensing.equipment_table.username = @gas_sensing.dummy2
      @gas_sensing.equipment_table.debit_head = @gas_sensing.debit
      @gas_sensing.equipment_table.role = @gas_sensing.dummy3
      @gas_sensing.dummy2 = nil
      @gas_sensing.dummy3 = nil
    else
      @gas_sensing.equipment_table.sample = @gas_sensing.sample
    @gas_sensing.equipment_table.contact_no = @gas_sensing.user.contact
    uploaded_files = params[:gas_sensing][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @gas_sensing.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @gas_sensing.equipment_table.dummy = "alloted"
    @gas_sensing.equipment_table.username = @gas_sensing.user.name
    @gas_sensing.equipment_table.equipname = "Glove Box"
    @gas_sensing.equipment_table.debit_head = @gas_sensing.debit
    @gas_sensing.equipment_table.role = @gas_sensing.user.role
    @gas_sensing.equipment_table.email = @gas_sensing.user.email
    @gas_sensing.equipment_table.dept = @gas_sensing.user.department
    @gas_sensing.equipment_table.profesion = @gas_sensing.user.profession
    @gas_sensing.equipment_table.orgname = @gas_sensing.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Gas Sensing").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    respond_to do |format|
      if @gas_sensing.save
        if  @gas_sensing.expresssample.present?
        equiplist = Equiplist.where(name: "Gas Sensing").first
        equiplist.expressslot =equiplist.expressslot- @gas_sensing.expresssample
        equiplist.save
       end
        if @gas_sensing.user.role=='student'||@gas_sensing.user.role=='faculty'
          GasSensingMailer.with(id:@gas_sensing.id, userid:current_user.id).InternalMail.deliver_later
        else
          GasSensingMailer.with(id:@gas_sensing.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @gas_sensing.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "gas_sensing was successfully created." }
            format.json { render :show, status: :created, location: @gas_sensing }
        else
        format.html { redirect_to home_index_path, notice: "Gas sensing was successfully created." }
        format.json { render :show, status: :created, location: @gas_sensing }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gas_sensing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gas_sensings/1 or /gas_sensings/1.json
  def update
    @gas_sensing.status="alloted"
    respond_to do |format|
      if @gas_sensing.update(gas_sensing_params)
        if @gas_sensing.status!= 'completed'
          GasSensingAllotedMailer.with(id:@gas_sensing.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_gassensing_path(@gas_sensing), notice: "Gas sensing was successfully updated." }
        format.json { render :show, status: :ok, location: @gas_sensing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gas_sensing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gas_sensings/1 or /gas_sensings/1.json
  def destroy
    @gas_sensing.destroy

    respond_to do |format|
      format.html { redirect_to gas_sensings_url, notice: "Gas sensing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_sensing
      @gas_sensing = GasSensing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gas_sensing_params
      params.require(:gas_sensing).permit(:sample, :gas, :toxicity, :compatibility, :carcinogenic, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname] , references: [])
    end
end
