class HrFesemCsController < ApplicationController
  before_action :set_hr_fesem_c, only: %i[ show edit update destroy ]

  # GET /hr_fesem_cs or /hr_fesem_cs.json
  def index
    @hr_fesem_cs = HrFesemC.all
  end

  # GET /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def show
  end

  # GET /hr_fesem_cs/new
  def new
    @hr_fesem_c = HrFesemC.new
    @user=User.find(params[:id])
    @hr_fesem_c.build_equipment_table
  end

  # GET /hr_fesem_cs/1/edit
  def edit
  end

  # POST /hr_fesem_cs or /hr_fesem_cs.json
  def create
    @hr_fesem_c = HrFesemC.new(hr_fesem_c_params)
    @hr_fesem_c.user=current_user
    @hr_fesem_c.status="pending"
    @hr_fesem_c.build_equipment_table
    if(@hr_fesem_c.entry_type== "manual")
      @hr_fesem_c.equipment_table.dummy = "proforma_confirmed"
      @hr_fesem_c.equipment_table.equipname = @hr_fesem_c.dummy1
      @hr_fesem_c.equipment_table.pay = @hr_fesem_c.amount
      @hr_fesem_c.equipment_table.username = @hr_fesem_c.dummy2
      @hr_fesem_c.equipment_table.debit_head = @hr_fesem_c.debit
      @hr_fesem_c.equipment_table.role = @hr_fesem_c.dummy3
      @hr_fesem_c.dummy2 = nil
      @hr_fesem_c.dummy3 = nil
    else
    @hr_fesem_c.equipment_table.dummy = "alloted"
    @hr_fesem_c.equipment_table.username = @hr_fesem_c.user.name
    @hr_fesem_c.equipment_table.equipname = "HR-FESEM [Carl Zeiss]"
    @hr_fesem_c.equipment_table.app_no = @hr_fesem_c.id
    @hr_fesem_c.equipment_table.debit_head = @hr_fesem_c.debit
    @hr_fesem_c.equipment_table.role = @hr_fesem_c.user.role
    @hr_fesem_c.equipment_table.email = @hr_fesem_c.user.email
    @hr_fesem_c.equipment_table.dept = @hr_fesem_c.user.department
    @hr_fesem_c.equipment_table.profesion = @hr_fesem_c.user.profession
    @hr_fesem_c.equipment_table.orgname = @hr_fesem_c.user.orgname
  end


    respond_to do |format|
      if @hr_fesem_c.save
        if @hr_fesem_c.user.role=='student'||@hr_fesem_c.user.role=='faculty'
          HrFesemCMailer.with(id:@hr_fesem_c.id, userid:current_user.id).InternalMail.deliver_later
        else
          HrFesemCMailer.with(id:@hr_fesem_c.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @hr_fesem_c.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "hr_fesem_c was successfully created." }
            format.json { render :show, status: :created, location: @hr_fesem_c }
        else
            format.html { redirect_to home_index_path, notice: "Hr fesem c was successfully created." }
            format.json { render :show, status: :created, location: @hr_fesem_c }
      end
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def update
    @hr_fesem_c.status="alloted"
    @hr_fesem_c.build_equipment_table
    respond_to do |format|
      if @hr_fesem_c.update(hr_fesem_c_params)
      HrFesemCAllotedMailer.with(id:@hr_fesem_c.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_fesemc_path(@hr_fesem_c), notice: "Hr fesem c was successfully updated." }
        format.json { render :show, status: :ok, location: @hr_fesem_c }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hr_fesem_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hr_fesem_cs/1 or /hr_fesem_cs/1.json
  def destroy
    @hr_fesem_c.destroy

    respond_to do |format|
      format.html { redirect_to hr_fesem_cs_url, notice: "Hr fesem c was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hr_fesem_c
      @hr_fesem_c = HrFesemC.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hr_fesem_c_params
      params.require(:hr_fesem_c).permit(:sample, :composition, :stype, :sphase, :eds,:measurement, :eds_required, :toxic, :conducting, :more, :debit, :slotdate, :slottime, :user_id,:entry_type, :amount, :dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] ,measuring: [], references: [])
    end
end
