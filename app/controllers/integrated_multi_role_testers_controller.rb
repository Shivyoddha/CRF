class IntegratedMultiRoleTestersController < ApplicationController
  before_action :set_integrated_multi_role_tester, only: %i[ show edit update destroy ]

  # GET /integrated_multi_role_testers or /integrated_multi_role_testers.json
  def index
    @integrated_multi_role_testers = IntegratedMultiRoleTester.all
  end

  # GET /integrated_multi_role_testers/1 or /integrated_multi_role_testers/1.json
  def show
  end

  # GET /integrated_multi_role_testers/new
  def new
    @user=User.find(params[:id])
    @integrated_multi_role_tester = IntegratedMultiRoleTester.new
    @integrated_multi_role_tester.build_equipment_table

  end

  # GET /integrated_multi_role_testers/1/edit
  def edit
  end

  # POST /integrated_multi_role_testers or /integrated_multi_role_testers.json
  def create
    @integrated_multi_role_tester = IntegratedMultiRoleTester.new(integrated_multi_role_tester_params)
    @integrated_multi_role_tester.user=current_user
    @integrated_multi_role_tester.status="pending"
    @integrated_multi_role_tester.build_equipment_table
    if(@integrated_multi_role_tester.entry_type== "manual")
      @integrated_multi_role_tester.equipment_table.dummy = "proforma_confirmed"
      @integrated_multi_role_tester.equipment_table.equipname = @integrated_multi_role_tester.dummy1
      @integrated_multi_role_tester.equipment_table.pay = @integrated_multi_role_tester.amount
      @integrated_multi_role_tester.equipment_table.username = @integrated_multi_role_tester.dummy2
      @integrated_multi_role_tester.equipment_table.debit_head = @integrated_multi_role_tester.debit
      @integrated_multi_role_tester.equipment_table.role = @integrated_multi_role_tester.dummy3
      @integrated_multi_role_tester.dummy2 = nil
      @integrated_multi_role_tester.dummy3 = nil
    else
    @integrated_multi_role_tester.equipment_table.dummy = "alloted"
    @integrated_multi_role_tester.equipment_table.username = @integrated_multi_role_tester.user.name
    @integrated_multi_role_tester.equipment_table.equipname = "integrated_multi_role_tester"
    @integrated_multi_role_tester.equipment_table.app_no = @integrated_multi_role_tester.id
    @integrated_multi_role_tester.equipment_table.debit_head = @integrated_multi_role_tester.debit
    @integrated_multi_role_tester.equipment_table.role = @integrated_multi_role_tester.user.role
    @integrated_multi_role_tester.equipment_table.email = @integrated_multi_role_tester.user.email
    @integrated_multi_role_tester.equipment_table.dept = @integrated_multi_role_tester.user.department
    @integrated_multi_role_tester.equipment_table.profesion = @integrated_multi_role_tester.user.profession
    @integrated_multi_role_tester.equipment_table.orgname = @integrated_multi_role_tester.user.orgname
  end

    respond_to do |format|
      if @integrated_multi_role_tester.save
        if @integrated_multi_role_tester.user.role=='student'||@integrated_multi_role_tester.user.role=='faculty'
          IntegratedMultiRoleTesterMailer.with(id:@integrated_multi_role_tester.id, userid:current_user.id).InternalMail.deliver_later
        else
          IntegratedMultiRoleTesterMailer.with(id:@integrated_multi_role_tester.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @integrated_multi_role_tester.entry_type=="manual"
          format.html { redirect_to payment_paymentM_path, notice: "integrated_multi_role_tester was successfully created." }
          format.json { render :show, status: :created, location: @integrated_multi_role_tester }
      else
        format.html { redirect_to home_index_path, notice: "Integrated multi role tester was successfully created." }
        format.json { render :show, status: :created, location: @integrated_multi_role_tester }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @integrated_multi_role_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /integrated_multi_role_testers/1 or /integrated_multi_role_testers/1.json
  def update
    @integrated_multi_role_tester.status="alloted"
    @integrated_multi_role_tester.build_equipment_table

    respond_to do |format|
      if @integrated_multi_role_tester.update(integrated_multi_role_tester_params)
        if @integrated_multi_role_tester.status!= 'completed'
          IntegratedMultiRoleTesterAllotedMailer.with(id:@integrated_multi_role_tester.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_integrated_path(@integrated_multi_role_tester), notice: "Integrated multi role tester was successfully updated." }
        format.json { render :show, status: :ok, location: @integrated_multi_role_tester }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @integrated_multi_role_tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integrated_multi_role_testers/1 or /integrated_multi_role_testers/1.json
  def destroy
    @integrated_multi_role_tester.destroy

    respond_to do |format|
      format.html { redirect_to integrated_multi_role_testers_url, notice: "Integrated multi role tester was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integrated_multi_role_tester
      @integrated_multi_role_tester = IntegratedMultiRoleTester.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def integrated_multi_role_tester_params
      params.require(:integrated_multi_role_tester).permit(:sample, :measurement, :stype, :loading, :temperature, :analysis, :more,:indentation,:debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3, equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname] , references: [])
    end
end
