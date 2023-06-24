class ProbeSonicatorsController < ApplicationController
  before_action :set_probe_sonicator, only: %i[ show edit update destroy ]

  # GET /probe_sonicators or /probe_sonicators.json
  def index
    @probe_sonicators = ProbeSonicator.all
  end

  # GET /probe_sonicators/1 or /probe_sonicators/1.json
  def show
  end

  # GET /probe_sonicators/new
  def new
    @probe_sonicator = ProbeSonicator.new
    @probe_sonicator.build_equipment_table
  end

  # GET /probe_sonicators/1/edit
  def edit
  end

  # POST /probe_sonicators or /probe_sonicators.json
  def create
    @probe_sonicator = ProbeSonicator.new(probe_sonicator_params)
    @probe_sonicator.user=current_user
    @probe_sonicator.status="pending"
    @probe_sonicator.build_equipment_table
    if(@probe_sonicator.entry_type== "manual")
      @probe_sonicator.equipment_table.dummy = "proforma_confirmed"
      @probe_sonicator.equipment_table.equipname = @probe_sonicator.dummy1
      @probe_sonicator.equipment_table.pay = @probe_sonicator.amount
      @probe_sonicator.equipment_table.username = @probe_sonicator.dummy2
      @probe_sonicator.equipment_table.debit_head = @probe_sonicator.debit
      @probe_sonicator.equipment_table.role = @probe_sonicator.dummy3
      @probe_sonicator.dummy2 = nil
      @probe_sonicator.dummy3 = nil
    else
    @probe_sonicator.equipment_table.dummy = "alloted"
    @probe_sonicator.equipment_table.username = @probe_sonicator.user.name
    @probe_sonicator.equipment_table.equipname = "Probe Sonicator"
    @probe_sonicator.equipment_table.app_no = @probe_sonicator.id
    @probe_sonicator.equipment_table.debit_head = @probe_sonicator.debit
    @probe_sonicator.equipment_table.role = @probe_sonicator.user.role
    @probe_sonicator.equipment_table.email = @probe_sonicator.user.email
    @probe_sonicator.equipment_table.dept = @probe_sonicator.user.department
    @probe_sonicator.equipment_table.profesion = @probe_sonicator.user.profession
    @probe_sonicator.equipment_table.orgname = @probe_sonicator.user.orgname
    end

    respond_to do |format|
      if @probe_sonicator.save
        if @probe_sonicator.user.role=='student'||@probe_sonicator.user.role=='faculty'
          ProbeSonicatorMailer.with(id:@probe_sonicator.id, userid:current_user.id).InternalMail.deliver_later
        else
          ProbeSonicatorMailer.with(id:@probe_sonicator.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @probe_sonicator.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "probe_sonicator was successfully created." }
            format.json { render :show, status: :created, location: @probe_sonicator }
        else
        format.html { redirect_to home_index_path, notice: "Probe sonicator was successfully created." }
        format.json { render :show, status: :created, location: @probe_sonicator }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @probe_sonicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /probe_sonicators/1 or /probe_sonicators/1.json
  def update
    @probe_sonicator.status="alloted"
    @probe_sonicator.build_equipment_table

    respond_to do |format|
      if @probe_sonicator.update(probe_sonicator_params)
        if @probe_sonicator.status!= 'completed'
          ProbeSonicatorAllotedMailer.with(id:@probe_sonicator.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_probe_path(@probe_sonicator), notice: "Probe sonicator was successfully updated." }
        format.json { render :show, status: :ok, location: @probe_sonicator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @probe_sonicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probe_sonicators/1 or /probe_sonicators/1.json
  def destroy
    @probe_sonicator.destroy

    respond_to do |format|
      format.html { redirect_to probe_sonicators_url, notice: "Probe sonicator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_probe_sonicator
      @probe_sonicator = ProbeSonicator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def probe_sonicator_params
      params.require(:probe_sonicator).permit(:sample, :size, :amplitude, :volume, :viscosity, :more, :debit, :slotdate, :slottime, :status,:user_id,:entry_type,:amount,:dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress,:orgname], references: [])
    end
end
