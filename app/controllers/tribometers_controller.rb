class TribometersController < ApplicationController
  before_action :set_tribometer, only: %i[ show edit update destroy ]

  # GET /tribometers or /tribometers.json
  def index
    @tribometers = Tribometer.all
  end

  # GET /tribometers/1 or /tribometers/1.json
  def show
  end

  # GET /tribometers/new
  def new
    @user=User.find(params[:id])
    @tribometer = Tribometer.new
    @tribometer.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Tribometer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Tribometer").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Tribometer").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /tribometers/1/edit
  def edit
  end

  # POST /tribometers or /tribometers.json
  def create
    @tribometer = Tribometer.new(tribometer_params)
    @tribometer.user=current_user
    @tribometer.status="pending"
    @tribometer.build_equipment_table
    if(@tribometer.entry_type== "manual")
    @tribometer.equipment_table.dummy = "proforma_confirmed"
    @tribometer.equipment_table.equipname = @tribometer.dummy1
    @tribometer.equipment_table.pay = @tribometer.amount
    @tribometer.equipment_table.username = @tribometer.dummy2
    @tribometer.equipment_table.debit_head = @tribometer.debit
    @tribometer.equipment_table.role = @tribometer.dummy3
    @tribometer.dummy2 = nil
    @tribometer.dummy3 = nil
  else
      @tribometer.equipment_table.sample = @tribometer.sample
    @tribometer.equipment_table.contact_no = @tribometer.user.contact
    uploaded_files = params[:tribometer][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @tribometer.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @tribometer.equipment_table.dummy = "alloted"
    @tribometer.equipment_table.username = @tribometer.user.name
    @tribometer.equipment_table.equipname = "Tribometer"
    @tribometer.equipment_table.app_no = @tribometer.id
    @tribometer.equipment_table.debit_head = @tribometer.debit
    @tribometer.equipment_table.role = @tribometer.user.role
    @tribometer.equipment_table.email = @tribometer.user.email
    @tribometer.equipment_table.dept = @tribometer.user.department
    @tribometer.equipment_table.profesion = @tribometer.user.profession
    @tribometer.equipment_table.orgname = @tribometer.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Tribometer").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    respond_to do |format|
      if @tribometer.save
        if  @tribometer.expresssample.present?
         equiplist = Equiplist.where(name: "Tribometer").first
         equiplist.expressslot =equiplist.expressslot- @tribometer.expresssample
         equiplist.save
        end
        if @tribometer.user.role=='student'||@tribometer.user.role=='faculty'
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).InternalMail.deliver_later
        else
          TribometerMailer.with(id:@tribometer.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @tribometer.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "tribometer was successfully created." }
            format.json { render :show, status: :created, location: @tribometer }
        else
        format.html { redirect_to home_index_path, notice: "Tribometer was successfully created." }
        format.json { render :show, status: :created, location: @tribometer }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tribometer.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /tribometers/1 or /tribometers/1.json
  def update
    @tribometer.status="alloted"

    respond_to do |format|
      if @tribometer.update(tribometer_params)
        if @tribometer.status!= 'completed'
          TribometerAllotedMailer.with(id:@tribometer.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_trib_path(@tribometer), notice: "Tribometer was successfully updated." }
        format.json { render :show, status: :ok, location: @tribometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tribometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tribometers/1 or /tribometers/1.json
  def destroy
    @tribometer.destroy

    respond_to do |format|
      format.html { redirect_to tribometers_url, notice: "Tribometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tribometer
      @tribometer = Tribometer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tribometer_params
      params.require(:tribometer).permit(:sample, :measurement, :stype, :temp_req, :loading, :indenter, :stroke, :more,:user_id,:status,:slotdate,:slottime,:debit,:entry_type,:dummy1,:dummy2,:dummy3,:amount,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname],references: [])
    end
end
