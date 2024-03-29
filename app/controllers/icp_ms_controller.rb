class IcpMsController < ApplicationController
  before_action :set_icp_m, only: %i[ show edit update destroy ]

  # GET /icp_ms or /icp_ms.json
  def index
    @icp_ms = IcpM.all
  end

  # GET /icp_ms/1 or /icp_ms/1.json
  def show
  end

  # GET /icp_ms/new
  def new
    @user=User.find(params[:id])
    @icp_m = IcpM.new()
    @icp_m.build_equipment_table
    @slot_type = params[:slot_type]
    @equiplist = Equiplist.all
    @equiplist_expressslot = Equiplist.where(name: "ICP-MS").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }
    @equiplist_expressstart = Equiplist.where(name: "ICP-MS").pluck(:expressstart).first&.strftime("%d/%m/%Y")
    @equiplist_expressend = Equiplist.where(name: "ICP-MS").pluck(:expressend).first&.strftime("%d/%m/%Y")

  end

  # GET /icp_ms/1/edit
  def edit
  end

  # POST /icp_ms or /icp_ms.json
  def create
    @icp_m = IcpM.new(icp_m_params)
    @icp_m.user=current_user
    @icp_m.status="pending"
    @icp_m.build_equipment_table
    if(@icp_m.entry_type== "manual")
      @icp_m.equipment_table.dummy = "proforma_confirmed"
      @icp_m.equipment_table.equipname = @icp_m.dummy1
      @icp_m.equipment_table.pay = @icp_m.amount
      @icp_m.equipment_table.username = @icp_m.dummy2
      @icp_m.equipment_table.debit_head = @icp_m.debit
      @icp_m.equipment_table.role = @icp_m.dummy3
      @icp_m.dummy2 = nil
      @icp_m.dummy3 = nil
    else
      @icp_m.equipment_table.sample = @icp_m.sample
    @icp_m.equipment_table.contact_no = @icp_m.user.contact
    uploaded_files = params[:icp_m][:references] # Assuming the field name is "references" in your form
    if(uploaded_files != nil)
    @icp_m.equipment_table.file_name = uploaded_files.map { |file| file.original_filename }
    end
    @icp_m.equipment_table.dummy = "alloted"
    @icp_m.equipment_table.username = @icp_m.user.name
    @icp_m.equipment_table.equipname = "ICP-MS"
    @icp_m.equipment_table.debit_head = @icp_m.debit
    @icp_m.equipment_table.role = @icp_m.user.role
    @icp_m.equipment_table.email = @icp_m.user.email
    @icp_m.equipment_table.dept = @icp_m.user.department
    @icp_m.equipment_table.profesion = @icp_m.user.profession
    @icp_m.equipment_table.orgname = @icp_m.user.orgname
  end
  @equiplist = Equiplist.all
  @equiplist_expressslot = Equiplist.where(name: "ICP-MS").pluck(:expressslot).map { |slot| slot.nil? ? "nil" : slot.to_i }


    respond_to do |format|
      if @icp_m.save
        if  @icp_m.expresssample.present?
         equiplist = Equiplist.where(name: "ICP-MS").first
         equiplist.expressslot =equiplist.expressslot- @icp_m.expresssample
         equiplist.save
        end
        if @icp_m.user.role=='student'||@icp_m.user.role=='faculty'
          IcpMMailer.with(id:@icp_m.id, userid:current_user.id).InternalMail.deliver_later
        else
          IcpMMailer.with(id:@icp_m.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @icp_m.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "icp_m was successfully created." }
            format.json { render :show, status: :created, location: @icp_m }
        else
        format.html { redirect_to home_index_path, notice: "Icp m was successfully created." }
        format.json { render :show, status: :created, location: @icp_m }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icp_ms/1 or /icp_ms/1.json
  def update
    @icp_m.status="alloted"
    respond_to do |format|
      if @icp_m.update(icp_m_params)
        if @icp_m.status!= 'completed'
        IcpMAllotedMailer.with(id:@icp_m.id, userid:current_user.id).Mail.deliver_later
      end
         @icp_m.status="alloted"
        format.html { redirect_to slotbooker_icp_path(@icp_m), notice: "Icp m was successfully updated." }
        format.json { render :show, status: :ok, location: @icp_m }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @icp_m.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icp_ms/1 or /icp_ms/1.json
  def destroy
    @icp_m.destroy

    respond_to do |format|
      format.html { redirect_to icp_ms_url, notice: "Icp m was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icp_m
      @icp_m = IcpM.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def icp_m_params
      params.require(:icp_m).permit(:sample, :composition, :sample_phase, :nature, :concentration, :testing, :temp, :toxicity, :compatibility, :hazard, :more, :debit, :status, :acid, :storage_condition, :slotdate, :slottime,:user_id,:entry_type, :amount, :dummy1,:dummy2,:dummy3,:slottype,:expresssample,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] ,references: [])
    end
end
