class MicroEdmsController < ApplicationController
  before_action :set_micro_edm, only: %i[ show edit update destroy ]

  # GET /micro_edms or /micro_edms.json
  def index
    @micro_edms = MicroEdm.all
  end

  # GET /micro_edms/1 or /micro_edms/1.json
  def show
  end

  # GET /micro_edms/new
  def new
    @user=User.find(params[:id])
    @micro_edm = MicroEdm.new
    @micro_edm.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "Micro-EDM").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "Micro-EDM").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "Micro-EDM").pluck(:expressend).first&.strftime("%d/%m/%Y")


  end

  # GET /micro_edms/1/edit
  def edit
  end

  # POST /micro_edms or /micro_edms.json
  def create
    @micro_edm = MicroEdm.new(micro_edm_params)
    @micro_edm.user=current_user
    @micro_edm.status="pending"
    @micro_edm.build_equipment_table
    if(@micro_edm.entry_type== "manual")
      @micro_edm.equipment_table.dummy = "proforma_confirmed"
      @micro_edm.equipment_table.equipname = @micro_edm.dummy1
      @micro_edm.equipment_table.pay = @micro_edm.amount
      @micro_edm.equipment_table.username = @micro_edm.dummy2
      @micro_edm.equipment_table.debit_head = @micro_edm.debit
      @micro_edm.equipment_table.role = @micro_edm.dummy3
      @micro_edm.dummy2 = nil
      @micro_edm.dummy3 = nil
    else
      @micro_edm.equipment_table.sample = @micro_edm.sample
    @micro_edm.equipment_table.contact_no = @micro_edm.user.contact
    uploaded_files = params[:micro_edm][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @micro_edm.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @micro_edm.equipment_table.dummy = "alloted"
    @micro_edm.equipment_table.username = @micro_edm.user.name
    @micro_edm.equipment_table.equipname = "micro_edm"
    @micro_edm.equipment_table.app_no = @micro_edm.id
    @micro_edm.equipment_table.debit_head = @micro_edm.debit
    @micro_edm.equipment_table.role = @micro_edm.user.role
    @micro_edm.equipment_table.email = @micro_edm.user.email
    @micro_edm.equipment_table.dept = @micro_edm.user.department
    @micro_edm.equipment_table.profesion = @micro_edm.user.profession
    @micro_edm.equipment_table.orgname = @micro_edm.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "Micro-EDM").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }

    respond_to do |format|
      if @micro_edm.save
        if  @micro_edm.expresssample.present?
        equiplist = Equiplist.where(name: "Micro-EDM").first
        equiplist.expressslot =equiplist.expressslot- @micro_edm.expresssample
        equiplist.save
       end
        if @micro_edm.user.role=='student'||@micro_edm.user.role=='faculty'
          MicroEdmMailer.with(id:@micro_edm.id, userid:current_user.id).InternalMail.deliver_later
        else
          MicroEdmMailer.with(id:@micro_edm.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @micro_edm.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "micro_edm was successfully created." }
          format.json { render :show, status: :created, location: @micro_edm }
      else
        format.html { redirect_to home_index_path, notice: "Micro edm was successfully created." }
        format.json { render :show, status: :created, location: @micro_edm }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micro_edm.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /micro_edms/1 or /micro_edms/1.json
  def update
     @micro_edm.status="alloted"
    @micro_edm.build_equipment_table

    respond_to do |format|
      if @micro_edm.update(micro_edm_params)
        if @micro_edm.status!= 'completed'
        end
        format.html { redirect_to slotbooker_microedm_path, notice: "Micro edm was successfully updated." }
        format.json { render :show, status: :ok, location: @micro_edm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micro_edm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micro_edms/1 or /micro_edms/1.json
  def destroy
    @micro_edm.destroy

    respond_to do |format|
      format.html { redirect_to micro_edms_url, notice: "Micro edm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micro_edm
      @micro_edm = MicroEdm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micro_edm_params
      params.require(:micro_edm).permit(:sample, :composition, :toolelectrode, :toolmaterial, :millingfeed, :millingspeed,:turningfeed,:turningspeed,:drillingdepth,:drillingspeed,:edmvoltage,:edmcapacitance,:edgpolarity,:edgwire,:edgfeed, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,:slottype,:expresssample, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:role, :profesion, :orgaddress,:orgname],references: [],measuerment: [] )
    end
end
