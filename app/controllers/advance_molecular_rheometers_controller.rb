class AdvanceMolecularRheometersController < ApplicationController
  before_action :set_advance_molecular_rheometer, only: %i[ show edit update destroy ]

  # GET /advance_molecular_rheometers or /advance_molecular_rheometers.json
  def index
    @advance_molecular_rheometers = AdvanceMolecularRheometer.all
  end

  # GET /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def show
  end

  # GET /advance_molecular_rheometers/new
  def new
    @user=User.find(params[:id])
    @advance_molecular_rheometer = AdvanceMolecularRheometer.new
    @advance_molecular_rheometer.build_equipment_table

  end

  # GET /advance_molecular_rheometers/1/edit
  def edit
  end

  # POST /advance_molecular_rheometers or /advance_molecular_rheometers.json
  def create
    @advance_molecular_rheometer = AdvanceMolecularRheometer.new(advance_molecular_rheometer_params)
    @advance_molecular_rheometer.user=current_user
    @advance_molecular_rheometer.status="pending"
    @advance_molecular_rheometer.build_equipment_table
    if(@advance_molecular_rheometer.entry_type== "manual")
      @advance_molecular_rheometer.equipment_table.dummy = "proforma_confirmed"
      @advance_molecular_rheometer.equipment_table.equipname = @advance_molecular_rheometer.dummy1
      @advance_molecular_rheometer.equipment_table.pay = @advance_molecular_rheometer.amount
      @advance_molecular_rheometer.equipment_table.username = @advance_molecular_rheometer.dummy2
      @advance_molecular_rheometer.equipment_table.debit_head = @advance_molecular_rheometer.debit
      @advance_molecular_rheometer.equipment_table.role = @advance_molecular_rheometer.dummy3
      @advance_molecular_rheometer.dummy2 = nil
      @advance_molecular_rheometer.dummy3 = nil
    else
    @advance_molecular_rheometer.equipment_table.dummy = "alloted"
    @advance_molecular_rheometer.equipment_table.username = @advance_molecular_rheometer.user.name
    @advance_molecular_rheometer.equipment_table.equipname = "Advance Modular Rheometer"
    @advance_molecular_rheometer.equipment_table.app_no = @advance_molecular_rheometer.id
    @advance_molecular_rheometer.equipment_table.debit_head = @advance_molecular_rheometer.debit
    @advance_molecular_rheometer.equipment_table.role = @advance_molecular_rheometer.user.role
    @advance_molecular_rheometer.equipment_table.email = @advance_molecular_rheometer.user.email
    @advance_molecular_rheometer.equipment_table.dept = @advance_molecular_rheometer.user.department
    @advance_molecular_rheometer.equipment_table.profesion = @advance_molecular_rheometer.user.profession
    @advance_molecular_rheometer.equipment_table.orgname = @advance_molecular_rheometer.user.orgname
  end

    respond_to do |format|

      if @advance_molecular_rheometer.save
        if @advance_molecular_rheometer.user.role=='student'||@advance_molecular_rheometer.user.role=='faculty'
          AdvanceMolecularRheometerMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).InternalMail.deliver_later
        else
          AdvanceMolecularRheometerMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @advance_molecular_rheometer.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "advance_molecular_rheometer was successfully created." }
            format.json { render :show, status: :created, location: @advance_molecular_rheometer }
        else
        format.html { redirect_to home_index_path, notice: "Advance molecular rheometer was successfully created." }
        format.json { render :show, status: :created, location: @advance_molecular_rheometer }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advance_molecular_rheometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def update
    @advance_molecular_rheometer.status="alloted"
    @advance_molecular_rheometer.build_equipment_table
    respond_to do |format|
      if @advance_molecular_rheometer.update(advance_molecular_rheometer_params)
         AdvanceMolecularRheometerAllotedMailer.with(id:@advance_molecular_rheometer.id, userid:current_user.id).Mail.deliver_later
        format.html { redirect_to slotbooker_amr_path(@advance_molecular_rheometer), notice: "Advance molecular rheometer was successfully updated." }
        format.json { render :show, status: :ok, location: @advance_molecular_rheometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advance_molecular_rheometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_molecular_rheometers/1 or /advance_molecular_rheometers/1.json
  def destroy
    @advance_molecular_rheometer.destroy

    respond_to do |format|
      format.html { redirect_to advance_molecular_rheometers_url, notice: "Advance molecular rheometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_molecular_rheometer
      @advance_molecular_rheometer = AdvanceMolecularRheometer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advance_molecular_rheometer_params
      params.require(:advance_molecular_rheometer).permit(:sample, :stype, :size, :nature, :temperature, :current, :shear_type, :shear_rate, :sweeps, :analysis, :toxicity, :more,:status,:debit,:slotdate, :slottime,:user_id,:entry_type,:amount, :dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname], references: [])
    end
end
