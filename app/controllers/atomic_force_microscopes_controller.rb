class AtomicForceMicroscopesController < ApplicationController
  before_action :set_atomic_force_microscope, only: %i[ show edit update destroy ]

  # GET /atomic_force_microscopes or /atomic_force_microscopes.json
  def index
    @atomic_force_microscopes = AtomicForceMicroscope.all
  end

  # GET /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def show
  end

  # GET /atomic_force_microscopes/new
  def new
    @user=User.find(params[:id])
    @atomic_force_microscope = AtomicForceMicroscope.new
    @atomic_force_microscope.build_equipment_table

  end

  # GET /atomic_force_microscopes/1/edit
  def edit
  end

  # POST /atomic_force_microscopes or /atomic_force_microscopes.json
  def create
    @atomic_force_microscope = AtomicForceMicroscope.new(atomic_force_microscope_params)
    @atomic_force_microscope.user=current_user
    @atomic_force_microscope.status="pending"
    @atomic_force_microscope.build_equipment_table
    if(@atomic_force_microscope.entry_type== "manual")
      @atomic_force_microscope.equipment_table.dummy = "proforma_confirmed"
      @atomic_force_microscope.equipment_table.equipname = @atomic_force_microscope.dummy1
      @atomic_force_microscope.equipment_table.pay = @atomic_force_microscope.amount
      @atomic_force_microscope.equipment_table.username = @atomic_force_microscope.dummy2
      @atomic_force_microscope.equipment_table.debit_head = @atomic_force_microscope.debit
      @atomic_force_microscope.equipment_table.role = @atomic_force_microscope.dummy3
      @atomic_force_microscope.dummy2 = nil
      @atomic_force_microscope.dummy3 = nil
else
    @atomic_force_microscope.equipment_table.dummy = "alloted"
    @atomic_force_microscope.equipment_table.username = @atomic_force_microscope.user.name
    @atomic_force_microscope.equipment_table.equipname = "Atomic Force Microscope"
    @atomic_force_microscope.equipment_table.app_no = @atomic_force_microscope.id
    @atomic_force_microscope.equipment_table.debit_head = @atomic_force_microscope.debit
    @atomic_force_microscope.equipment_table.role = @atomic_force_microscope.user.role
    @atomic_force_microscope.equipment_table.email = @atomic_force_microscope.user.email
    @atomic_force_microscope.equipment_table.dept = @atomic_force_microscope.user.department
    @atomic_force_microscope.equipment_table.profesion = @atomic_force_microscope.user.profession
    @atomic_force_microscope.equipment_table.orgname = @atomic_force_microscope.user.orgname
  end

    respond_to do |format|
      if @atomic_force_microscope.save
        if @atomic_force_microscope.user.role=='student'||@atomic_force_microscope.user.role=='faculty'
          AtomicForceMicroscopeMailer.with(id:@atomic_force_microscope.id, userid:current_user.id).InternalMail.deliver_later
        else
          AtomicForceMicroscopeMailer.with(id:@atomic_force_microscope.id, userid:current_user.id).ExternalMail.deliver_later
        end
        if @atomic_force_microscope.entry_type=="manual"
            format.html { redirect_to payment_paymentM_path, notice: "atomic_force_microscope was successfully created." }
            format.json { render :show, status: :created, location: @atomic_force_microscope }
        else
        format.html { redirect_to home_index_path, notice: "Atomic force microscope was successfully created." }
        format.json { render :show, status: :created, location: @atomic_force_microscope }
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atomic_force_microscope.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def update
    @atomic_force_microscope.status="alloted"
    @atomic_force_microscope.build_equipment_table
    respond_to do |format|
      if @atomic_force_microscope.update(atomic_force_microscope_params)
        if @atomic_force_microscope.status!= 'completed'
          AtomicForceMicroscopeAllotedMailer.with(id:@atomic_force_microscope.id, userid:current_user.id).Mail.deliver_later
        end
        format.html { redirect_to slotbooker_atomic_path(@atomic_force_microscope), notice: "Atomic force microscope was successfully updated." }
        format.json { render :show, status: :ok, location: @atomic_force_microscope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atomic_force_microscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atomic_force_microscopes/1 or /atomic_force_microscopes/1.json
  def destroy
    @atomic_force_microscope.destroy

    respond_to do |format|
      format.html { redirect_to atomic_force_microscopes_url, notice: "Atomic force microscope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atomic_force_microscope
      @atomic_force_microscope = AtomicForceMicroscope.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atomic_force_microscope_params
      params.require(:atomic_force_microscope).permit(:sample, :stype, :technique, :scan_rate, :x, :y, :description, :toxicity, :compatability, :carcinogenic, :more, :slotdate, :slottime, :status,:user_id,:entry_type, :amount, :dummy1,:dummy2,:dummy3,equipment_table_attributes: [:username, :app_no, :debit_head, :dummy, :pay, :dept, :equipname, :email,:role, :profesion, :orgaddress, :orgname],technique: [],references: [])
    end
end
